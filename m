From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 01/17] fdt: Tidy up a few fdtdec problems
Date: Mon, 5 Dec 2011 13:40:55 -0800
Message-ID: <CAPnjgZ0h39vB2H4MuCwVqb2Tgcr4==yN8Pj6a3s9dciyXPBu1A@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<1322878300-5551-2-git-send-email-sjg@chromium.org>
	<4EDD375D.9090509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EDD375D.9090509@nvidia.com>
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

On Mon, Dec 5, 2011 at 1:27 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/02/2011 07:11 PM, Simon Glass wrote:
> ...
>> +int fdtdec_get_is_enabled(const void *blob, int node)
>> =A0{
>> =A0 =A0 =A0 const char *cell;
>>
>> =A0 =A0 =A0 cell =3D fdt_getprop(blob, node, "status", NULL);
>> =A0 =A0 =A0 if (cell)
>> - =A0 =A0 =A0 =A0 =A0 =A0 return 0 =3D=3D strcmp(cell, "ok");
>> - =A0 =A0 return default_val;
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0 =3D=3D strcmp(cell, "okay");
>> + =A0 =A0 return 1;
>> =A0}
>
> The kernel accepts both okay (standard) and ok (non-standard). I assume
> the latter is required for some in-use-but-technically-incorrect .dts
> files. I imagine U-Boot should act like the kernel here.

Given that we are just starting out with fdt, do you think it would be
better to not bloat the code in this way? I don't mind either way -
just asking :-)

Regards,
Simon

>
> (Sorry if I wasn't clear here before; that's certainly what I intended
> to mean)
>
> --
> nvpublic
