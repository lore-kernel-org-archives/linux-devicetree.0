From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Print a device-tree message at KERN_WARNING level
Date: Mon, 14 Feb 2011 08:27:34 -0700
Message-ID: <AANLkTi=n7ogDGzwemR4pP5Uhp-ZoDti+qZ4ubqvjuosK@mail.gmail.com>
References: <1297085223.1741.24.camel@t41.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297085223.1741.24.camel-3NV1x7ENidhrKue/0VVhAg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 7, 2011 at 6:26 AM, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
> For some time now a laptop tracking Fedora's rawhide prints the message
> =A0 =A0/proc/device-tree: can't find root
>
> early in each boot. It turns out that in recent Fedora kernels
> CONFIG_PROC_DEVICETREE is set to Y by default. (Note that the config
> help for PROC_DEVICETREE tells to "say Y here" if "unsure".) Apparently
> this is a consequence of their wish to have one kernel for both OPLC x86
> and non-OLPC x86 hardware.
>
> Since the majority of x86 hardware will be non-OLPC, KERN_WARNING seems
> to be more appropriate than KERN_ERR. (The main benefit of the
> KERN_WARNING level is that Fedora's plymouth bootsplash should now hide
> this message.)
>
> Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
> ---
> Previously discussed in the thread starting here:
> http://lists.fedoraproject.org/pipermail/kernel/2011-February/003012.html
>
> As stated in
> http://lists.fedoraproject.org/pipermail/kernel/2011-February/003011.html=
 , I have no idea what this message means. I just prefer to not see it. Thi=
s seems to be the easiest way to achieve that. But maybe there's an elegant=
 way to drop this message all together on hardware for which it's apparentl=
y irrelevant.

The message is unnecessary.  It can just be dropped altogether, or
changed to a pr_debug().

g.

>
> =A0fs/proc/proc_devtree.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/proc/proc_devtree.c b/fs/proc/proc_devtree.c
> index d9396a4..71dd779 100644
> --- a/fs/proc/proc_devtree.c
> +++ b/fs/proc/proc_devtree.c
> @@ -233,7 +233,7 @@ void __init proc_device_tree_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0root =3D of_find_node_by_path("/");
> =A0 =A0 =A0 =A0if (root =3D=3D NULL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "/proc/device-tree: can't f=
ind root\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "/proc/device-tree: can=
't find root\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0proc_device_tree_add_node(root, proc_device_tree);
> --
> 1.7.4
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
