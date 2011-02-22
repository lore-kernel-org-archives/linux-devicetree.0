From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 11/11] rtc/cmos: add OF bindings
Date: Tue, 22 Feb 2011 13:50:48 -0700
Message-ID: <AANLkTimYJh8wU8vhN+MGysyjAn2pCaqL-mGE1Vjr5TYB@mail.gmail.com>
References: <1298405266-1624-1-git-send-email-bigeasy@linutronix.de>
	<1298405266-1624-12-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1298405266-1624-12-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 22, 2011 at 1:07 PM, Sebastian Andrzej Siewior
<bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> This allows to load the OF driver based informations from the device
> tree. Systems without BIOS may need to perform some initialization.
> PowerPC creates a PNP device from the OF information and performs this
> kind of initialization in their private PCI quirk. This looks more
> generic.
> This patch also avoids registering the platform RTC driver on X86 if we
> have a device tree blob. Without it we end up with of this devices. It
> is in this hunk in order to remain bisectable.
>
> Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Itty-bitty nit below, but otherwise:

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

[...]
> diff --git a/include/linux/of.h b/include/linux/of.h
> index d9dd664..8de7c29 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -70,6 +70,11 @@ extern struct device_node *allnodes;
> =A0extern struct device_node *of_chosen;
> =A0extern rwlock_t devtree_lock;
>
> +static inline int of_have_populated_dt(void)

Personally, I'd make this a 'bool' return value.

> +{
> + =A0 =A0 =A0 return allnodes !=3D NULL;
> +}
> +
> =A0static inline bool of_node_is_root(const struct device_node *node)
> =A0{
> =A0 =A0 =A0 =A0return node && (node->parent =3D=3D NULL);
> @@ -222,5 +227,12 @@ extern void of_attach_node(struct device_node *);
> =A0extern void of_detach_node(struct device_node *);
> =A0#endif
>
> +#else
> +
> +static inline int of_have_populated_dt(void)
> +{
> + =A0 =A0 =A0 return 0;

and then 'return false'; here.

But by *no means* should this patch be delayed by this comment.  :-)

g.
