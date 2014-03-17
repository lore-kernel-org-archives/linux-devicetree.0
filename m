From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] spi: Using Trigger number to transmit/receive data
Date: Mon, 17 Mar 2014 08:54:12 +0100
Message-ID: <CAMuHMdWP-tNCtnwP6=XZ1BNacWretVYjrpbT3R+KTEO=047+Nw@mail.gmail.com>
References: <1394699364-5669-1-git-send-email-cm-hiep@jinso.co.jp>
	<1394699364-5669-2-git-send-email-cm-hiep@jinso.co.jp>
	<CAMuHMdUpm_4f7LynObRA+NDn4vqeUc0a2XZW-E=4LKL_Ro3XZw@mail.gmail.com>
	<53264BA4.3000401@jinso.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <53264BA4.3000401@jinso.co.jp>
Sender: linux-sh-owner@vger.kernel.org
To: Cao Minh Hiep <cm-hiep@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven <geert+renesas@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Hi Hiep,

On Mon, Mar 17, 2014 at 2:11 AM, =E3=82=AB=E3=82=AA=E3=80=80=E3=83=9F=E3=
=83=B3=E3=80=80=E3=83=92=E3=82=A7=E3=83=83=E3=83=97 <cm-hiep@jinso.co.j=
p> wrote:
> On 03/13/2014 06:23 PM, Geert Uytterhoeven wrote:
>> On Thu, Mar 13, 2014 at 9:29 AM, Cao Minh Hiep <cm-hiep@jinso.co.jp>
>> wrote:
>>> In order to transmit and receive data when have 32 bytes of data th=
at
>>> ready has prepared on Transmit/Receive Buffer to transmit or receiv=
e.
>>> Instead transmits/receives a byte data using Transmit/Receive Buffe=
r
>>> Data Triggering Number will improve the speed of transfer data.
>>
>> Thanks for your patch, this looks like a valuable improvement!
>>
>> Unfortunately your patch doesn't apply against spi/for-next anymore,=
 as
>> the driver has changed a lot lately, due to the addition of RZ/A1H a=
nd
>> Quad/Dual support.
>>
> Thanks, Do you mean this patch did not need for next and I don't mind=
 about
> it?

It means you will have to rework your patch to apply on top of
https://git.kernel.org/cgit/linux/kernel/git/broonie/spi.git/tree/drive=
rs/spi?h=3Dfor-next
before the SPI maintainer can accept it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
