From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 01/14] fdt: Tidy up a few fdtdec problems
Date: Thu, 1 Dec 2011 12:59:44 -0800
Message-ID: <CAPnjgZ3SD0qMxZb6KzjeH0iQ8KLnb62UeuOZ-BACXL2m8vCVJA@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<4ED3D3F2.8070302@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED3D3F2.8070302@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Nov 28, 2011 at 10:33 AM, Stephen Warren <swarren@nvidia.com> wrote:
> On 11/23/2011 08:54 PM, Simon Glass wrote:
>> This fixes three trivial issues in fdtdec.c:
>> 1. fdtdec_get_is_enabled() doesn't really need a default value
>> 2. The fdt must be word-aligned, since otherwise it will fail on ARM
>> 3. The compat_names[] array is missing its first element
>
>> diff --git a/lib/fdtdec.c b/lib/fdtdec.c
> ...
>> =A0#define COMPAT(id, name) name
>> =A0static const char * const compat_names[COMPAT_COUNT] =3D {
>> + =A0 =A0 COMPAT(UNKNOWN, "<none>"),
>> =A0};
>
> Could you educate me on why that change is necessary? Maybe explain this
> in the commit description?

Yes I will update the description. The first element of the array is
supposed to be an invalid entry (see enum fdt_compat_id).

>
>> -int fdtdec_get_is_enabled(const void *blob, int node, int default_val)
>> +int fdtdec_get_is_enabled(const void *blob, int node)
>> =A0{
>> =A0 =A0 =A0 const char *cell;
>>
>> =A0 =A0 =A0 cell =3D fdt_getprop(blob, node, "status", NULL);
>> =A0 =A0 =A0 if (cell)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0 =3D=3D strcmp(cell, "ok");
>> - =A0 =A0 return default_val;
>> + =A0 =A0 return 1;
>> =A0}
>
> Not that this patch changes this, but isn't "okay" also a legal
> "enabled" value, and perhaps even the recommended value? See
> http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-July/006389.htm=
l.

Yes, I will change this, thanks.

Regards,
Simon

>
> --
> nvpublic
>
