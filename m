From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: Make of_find_node_by_path() traverse /aliases for
	relative paths.
Date: Tue, 1 Mar 2011 17:56:22 -0700
Message-ID: <AANLkTikUWwO_7-GFXJtvDmrib5LawVjgAqKmaGU=gJ75@mail.gmail.com>
References: <1299021304-4703-1-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1299021304-4703-1-git-send-email-ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 1, 2011 at 4:15 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wro=
te:
> Currently all paths passed to of_find_node_by_path() must begin with a
> '/', indicating a full path to the desired node.
>
> Augment the look-up code so that if a path does *not* begin with '/',
> the path is used as the name of an /aliases property. =A0The value of
> this alias is then used as the full node path to be found.

Nice, thanks David!

However, there is one more use case that this patch needs to handle.
Right now it will support:

"/full/path/to/node"
and
"alias"

but in OF terms it is also valid to specify:

"alias/relative/path/to/child"

How I would handle this is to split on the first '/', use the front
half to look up the path to the alias, and then concatenate the alias
path with the child node relative path before doing the full lookup.
Although that might not be the best way since it requires doing a copy
to a temporary buffer.

Alternately, it could be implemented with a multi test loop that does
something like:

for (; np; np =3D np->allnext) {
        int len =3D strlen(alias_path);
        if (np->full_name &&
            (strncmp(np->full_name, alias_path, len) =3D=3D 0) &&
            (np->full_name[len] =3D=3D '/') &&
            (strncmp(&np->full_name[len+1], relative_path,
strlen(relative_path)) =3D=3D 0)) {
                of_node_get(np);
                goto out;
        }
}


[...]
> +
> + =A0 =A0 =A0 if (path[0] !=3D '/') {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 aliases =3D of_find_node_by_path("/aliases"=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!aliases)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 path =3D of_get_property(aliases, path, NUL=
L);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* The alias must begin with '/', otherwi=
se we could
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* get stuck in an endless loop and blow =
out the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* stack.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/

I don't think this is true (the endless loop part).  I don't see how
this would enter into a recursive set of calls other than the call
of_find_node_by_path("/aliases") which is hard coded with a '/' in the
first character.  The test for path[0] !=3D '/' looks unnecessary, or am
I missing something?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!path || path[0] !=3D '/')
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0for (; np; np =3D np->allnext) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (np->full_name && (of_node_cmp(np->full=
_name, path) =3D=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&& of_node_get(np))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
> +out:
> + =A0 =A0 =A0 if (aliases)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(aliases);

Since there is only one error path that needs to do this
of_node_put(), I'd put it right into the error path and save one test.

g.
