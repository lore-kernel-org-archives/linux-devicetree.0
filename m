From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 04/17] fdt: Add basic support for decoding
 GPIO definitions
Date: Tue, 6 Dec 2011 17:21:27 -0800
Message-ID: <CAPnjgZ2dof_-hJadap6Jkc-1wLo5i2XonMpn62k_5jmd_Zvr=g@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<4EDD440C.80002@nvidia.com>
	<CAPnjgZ03+tfMhkqo4=uarcAf1E8hTfvSF_Y0=V70tuqP866QQQ@mail.gmail.com>
	<201112052256.00939.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <201112052256.00939.vapier@gentoo.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Mike Frysinger <vapier@gentoo.org>
Cc: u-boot@lists.denx.de, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On Mon, Dec 5, 2011 at 7:55 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> On Monday 05 December 2011 17:52:01 Simon Glass wrote:
>> On Mon, Dec 5, 2011 at 2:22 PM, Stephen Warren wrote:
>> > On 12/05/2011 02:56 PM, Simon Glass wrote:
>> > * A system-wide GPIO ID, in which case the numbering is "virtual" (e.g.
>> > a concatenation of the GPIOs on all the present controllers), and you
>> > can choose to start the first controller's GPIOs at 0, 1, 1000 etc.,
>> > thus leaving -1, 0, -n..999 etc. as invalid GPIOs. This is what the
>> > Linux kernel's gpiolib uses (and some say this global numbering scheme
>> > was a mistake).
>>
>> Well maybe it was a mistake, but it seems painful for the user to
>> translate GPIO numbers in this way. U-Boot's GPIO command takes a GPIO
>> number, which starts at zero.
>
> u-boot should simply follow what linux is doing as it keeps things a hell=
 of a
> lot simpler for us: the code is done, people moving between the worlds do=
n't
> get surprised and screw something up, and we don't accidentally forget "o=
h, in
> u-boot we do XXX instead of YYY" and screw things up ourselves.

Good, I think that is what we are doing. But if Linux changes the GPIO
numbering we may need to do something.

>
>> >> I currently use the max value available to the u8. We can change it at
>> >> will when we update the u8 type to u16 which is why I made it a
>> >> constant.
>> >
>> > include/asm-generic/gpio.h seems to use an int to represent a GPIO. I'd
>> > suggest these APIs do the same, rather than use a u8.
>>
>> Do you mean the fdt_gpio_state structure? I have not used u8 for any
>> function calls and would not.
>
> the asm-generic/gpio.h using "int" as a gpio is wrong. =A0it should be
> "unsigned". =A0there's a patch somewhere to fix this.

OK, will wait to see it.

>
>> This adds 3 bytes for every entry. What is the benefit? People get
>> upset when we waste memory!
>
> some systems have more than 256 GPIOs. =A0it's actually not that hard to =
hit the
> limit.
> -mike

Not for me so far, but I don't doubt it. I have changed it to uint in
the series.

Regards,
Simon
