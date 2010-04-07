From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/address: fix dt reading on LE machines
Date: Tue, 6 Apr 2010 18:58:02 -0600
Message-ID: <x2qfa686aa41004061758u55d734f1qee18c02c8d68a5fb@mail.gmail.com>
References: <1270169737-10686-1-git-send-email-r.herring@freescale.com>
	<1270169737-10686-2-git-send-email-r.herring@freescale.com>
	<1270169737-10686-3-git-send-email-r.herring@freescale.com>
	<1270169737-10686-4-git-send-email-r.herring@freescale.com>
	<1270169737-10686-5-git-send-email-r.herring@freescale.com>
	<1270169737-10686-6-git-send-email-r.herring@freescale.com>
	<w2rfa686aa41004012346yaa6d7292y8f9388f6a0cb72cb@mail.gmail.com>
	<DE2504B3A515524BBE6934369EFDC0DA09253076@az33exm20.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <DE2504B3A515524BBE6934369EFDC0DA09253076-ofAVchDyotZVGH30ZtLfJpjmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Herring Robert-RA7055 <ra7055-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 5, 2010 at 7:23 AM, Herring Robert-RA7055
<ra7055-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Grant,
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On
>> Behalf Of Grant Likely
>> Sent: Friday, April 02, 2010 1:46 AM
>> To: Herring Robert-RA7055
>> Cc: Jeremy Kerr
>> Subject: Re: [PATCH] of/address: fix dt reading on LE machines
>>
>> On Thu, Apr 1, 2010 at 6:55 PM, Rob Herring
>> <r.herring-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > The debug prints are still wrong, but the result is correct.
>> >
>> > Signed-off-by: Rob Herring <r.herring-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > ---
>> > =A0drivers/of/address.c | =A0 =A02 +-
>> > =A01 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> > index c3c7c7d..1b285ef 100644
>> > --- a/drivers/of/address.c
>> > +++ b/drivers/of/address.c
>> > @@ -430,7 +430,7 @@ u64 __of_translate_address(struct
>> device_node *dev, const u32 *in_addr,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* If root, we have finished */
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (parent =3D=3D NULL) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_debug("OF: reached r=
oot node\n");
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 result =3D of_read_numbe=
r(addr, na);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 result =3D *((u64*)addr);
>>
>> It's too late at night for me to think clearly. =A0I could use a better
>> explanation on what you found when you investigated this.
>
> Tracing back the source of addr, it does not point to the DTB and is alre=
ady in LE format. So the conversion is not needed. On BE machine, the conve=
rsion is a nop, so it happens to work.
>
> This fix really is just a bandaid on the problem as the debug printk's sh=
ow. The real problem is all DTB accesses need to go thru of_read_number or =
other accessors. Also, the accesors should be restricted to DTB accesses on=
ly.

Okay, I think I found the problem.  The bus translation functions take
in raw device tree data, but put back out cpu endian data into the
same data buffer.  The kicker is these functions get called multiple
times as addresses get translated between addressing domains; so
endianess can flip back and forth every time translation occurs.  Each
translation hook really needs to emit the same form it accepts.  I
seem to have fixed it now.  Here's the patch (and some unrelated
stuff, just because this is wip).  I'll test is a bit and push it out
to my tree.

It's not a perfect fix because it is still prone to coding errors.  I
should really look at creating a new pointer type instead of void* for
holding raw device tree property data so that I can get the compiler
to catch a lot of the errors for me; but I suspect that will be a lot
of work before I get it fixed.  I need to think about it more.

g.

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 95e4d3d..d81a370 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -24,7 +24,7 @@ static void of_dump_addr(const char *s, const u32
*addr, int na)
 {
 	printk(KERN_DEBUG "%s", s);
 	while (na--)
-		printk(" %08x", *(addr++));
+		printk(" %08x", be32_to_cpu(*(addr++)));
 	printk("\n");
 }
 #else
@@ -81,8 +81,8 @@ static int of_bus_default_translate(u32 *addr, u64
offset, int na)
 	memset(addr, 0, na * 4);
 	a +=3D offset;
 	if (na > 1)
-		addr[na - 2] =3D a >> 32;
-	addr[na - 1] =3D a & 0xffffffffu;
+		addr[na - 2] =3D cpu_to_be32(a >> 32);
+	addr[na - 1] =3D cpu_to_be32(a & 0xffffffffu);

 	return 0;
 }
@@ -337,6 +337,8 @@ static int of_translate_one(struct device_node
*parent, struct of_bus *bus,
 	int rone;
 	u64 offset =3D OF_BAD_ADDR;

+	ranges =3D of_get_property(parent, rprop, &rlen);
+
 	/* Normally, an absence of a "ranges" property means we are
 	 * crossing a non-translatable boundary, and thus the addresses
 	 * below the current not cannot be converted to CPU physical ones.
@@ -348,12 +350,21 @@ static int of_translate_one(struct device_node
*parent, struct of_bus *bus,
 	 * a 1:1 translation at that level. It's up to the caller not to try
 	 * to translate addresses that aren't supposed to be translated in
 	 * the first place. --BenH.
+	 *
+	 * As far as we know, this damage only exists on Apple machines, so
+	 * This code is only enabled on powerpc. --gcl
 	 */
-	ranges =3D of_get_property(parent, rprop, &rlen);
+#if !defined(CONFIG_PPC)
+	if (ranges =3D=3D NULL) {
+		pr_err("OF: no ranges; cannot translate\n");
+		return 1;
+	}
+#endif /* !defined(CONFIG_PPC) */
+
 	if (ranges =3D=3D NULL || rlen =3D=3D 0) {
 		offset =3D of_read_number(addr, na);
 		memset(addr, 0, pna * 4);
-		pr_debug("OF: no ranges, 1:1 translation\n");
+		pr_debug("OF: empty ranges; 1:1 translation\n");
 		goto finish;
 	}
