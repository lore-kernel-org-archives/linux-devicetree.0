From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] distclean: Remove generated .dtb files
Date: Sun, 6 Nov 2011 11:42:54 -0700
Message-ID: <CACxGe6vK24j=L_WQWf5eqmdKXf0gCD=waAbJj4eq9d63O8mbvA@mail.gmail.com>
References: <1320473955-4500-1-git-send-email-dirk.behme@de.bosch.com>
 <20111106183802.GB2546@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111106183802.GB2546-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dirk Behme <dirk.behme-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 6, 2011 at 11:38 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Sat, Nov 05, 2011 at 07:19:15AM +0100, Dirk Behme wrote:
>> The patch 'arm/dt: Add dtb make rule' adds support to
>> create a .dtb file. But this is never removed afterwards.
>> Remove the generated .dtb file if 'distclean' is called.
>>
>> Signed-off-by: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>> CC: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> CC: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> CC: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

... although why are only the .dtb files needed in the clean list?
How are the other built files cleaned?  'make clean' does remove the
other images, but I don't know what the mechanism is.

g.

>
>> ---
>> =A0arch/arm/boot/Makefile | =A0 =A02 ++
>> =A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
>> index 1cd9b0a..08f0d35 100644
>> --- a/arch/arm/boot/Makefile
>> +++ b/arch/arm/boot/Makefile
>> @@ -71,6 +71,8 @@ $(obj)/%.dtb: $(src)/dts/%.dts
>>
>> =A0$(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
>>
>> +clean-files :=3D *.dtb
>> +
>> =A0quiet_cmd_uimage =3D UIMAGE =A0$@
>> =A0 =A0 =A0 =A0cmd_uimage =3D $(CONFIG_SHELL) $(MKIMAGE) -A arm -O linux=
 -T kernel \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-C none -a $(LOADADDR) -e $(STARTADDR=
) \
>> --
>> 1.7.0.4
>>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
