From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [dtc RFC PATCH] Enforce node name unit-address presence/absence
Date: Wed, 18 Sep 2013 13:41:16 -0700
Message-ID: <CAOesGMg0Rrmew0iK-Gtrx_UiODhpro_S2xUxQi0gZ+7PJmBHnw@mail.gmail.com>
References: <1379535836-12726-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379535836-12726-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2013 at 1:23 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
> node that has a reg property must include a unit address in its name
> with value matching the first entry in its reg property. Conversely, if
> a node does not have a reg property, the node name must not include a
> unit address.
>
> Implement a check for this. The code doesn't validate the format of the
> unit address; ePAPR implies this may vary from binding to binding, so
> I'm not sure that it's possible to validate the value itself.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This depends on my previous patch "Ensure all tests have matching reg
> and unit address".
>
> Note that this patch should not yet be applied; it will cause many real-
> world *.dts files to fail to compile. Those need to be fixed first.
> However, if/when that happens, this patch may be useful.
> ---
>  checks.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/checks.c b/checks.c
> index ee96a25..c80a055 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -287,9 +287,25 @@ NODE_ERROR(node_name_chars, PROPNODECHARS "@");
>  static void check_node_name_format(struct check *c, struct node *dt,
>                                    struct node *node)
>  {
> -       if (strchr(get_unitname(node), '@'))
> +       const char *unitname;
> +       struct property *prop;
> +
> +       unitname = get_unitname(node);
> +
> +       if (strchr(unitname, '@'))
>                 FAIL(c, "Node %s has multiple '@' characters in name",
>                      node->fullpath);
> +
> +       prop = get_property(node, "reg");
> +       if (prop) {
> +               if (!unitname[0])
> +                       FAIL(c, "Node %s has a reg property, but no unit name",
> +                           node->fullpath);
> +       } else {
> +               if (unitname[0])
> +                       FAIL(c, "Node %s has a unit name, but no reg property",
> +                           node->fullpath);

These checks are very useful, even though they might sort of cross
over the domain to what a dtc linter would do instead of the compiler.

Anyway, I think it'd be better to produce warnings than errors for
this. That way we could also merge it now while the trees are fixed
up.

Also, maybe warn for @0x<foo>, which is another unpreferred syntax, it
should just be @<foo> (with foo being in hex).


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
