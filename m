From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: overlay: Fix uninitialized vars in dup_and_fixup_symbol_prop()
Date: Tue, 19 Sep 2017 22:16:06 +0200
Message-ID: <CAMuHMdUo=O6J4Qs8J+Jrx6LFeLRmE77hzpfaAUFYtdfYN1-hpw@mail.gmail.com>
References: <1505039164-25468-1-git-send-email-geert@linux-m68k.org> <59C16197.4040403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59C16197.4040403@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Tue, Sep 19, 2017 at 8:27 PM, Frank Rowand <frowand.list@gmail.com> wrot=
e:
> On 09/10/17 03:26, Geert Uytterhoeven wrote:
>> With gcc 4.1.2:
>>
>>     drivers/of/overlay.c: In function =E2=80=98dup_and_fixup_symbol_prop=
=E2=80=99:
>>     drivers/of/overlay.c:108: warning: =E2=80=98overlay_name_len=E2=80=
=99 may be used uninitialized in this function
>>     drivers/of/overlay.c:100: warning: =E2=80=98ovinfo=E2=80=99 may be u=
sed uninitialized in this function
>>
>> Indeed, if ov->count =3D=3D 0, both variables are uninitialized, which m=
ay
>> lead to a crash when dereferencing ovinfo later.
>>
>> Currently this is a false positive, as the sole creator of of_overlay
>> structures (of_build_overlay_info(), introduced in commit
>> 7518b5890d8ac366 ("of/overlay: Introduce DT overlay support") checks for
>> this.
>>
>> To prevent future issues, add a check for a zero ov->count to
>> dup_and_fixup_symbol_prop().  Note that this does not get rid of the
>> actual compiler warning.
>>
>> Fixes: d1651b03c2df75db ("of: overlay: add overlay symbols to live devic=
e tree")
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>  drivers/of/overlay.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 8ecfee31ab6d3874..ebe19e0f8e4d1f4b 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>> @@ -108,7 +108,7 @@ static struct property *dup_and_fixup_symbol_prop(st=
ruct of_overlay *ov,
>>       int overlay_name_len;
>>       int target_path_len;
>>
>> -     if (!prop->value)
>> +     if (!ov->count || !prop->value)
>>               return NULL;
>>       symbol_path =3D prop->value;
>>
>
> I did not see this patch due to an overzealous spam filter.  I noticed it
> when Rob replied with his applied email.
>
> This check is not needed to prevent accessing overlay_name_len and ovinfo
> when ov->count =3D=3D 0.  That is already prevented by:
>
>         if (k >=3D ov->count)
>                 goto err_free;
>
> because k will be zero and ov->count will be zero.

Thank you, I stand corrected.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
