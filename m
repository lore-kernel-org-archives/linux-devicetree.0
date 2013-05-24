From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: ux500: enable the crypto and hash on all dbx500
Date: Fri, 24 May 2013 13:13:58 +0200
Message-ID: <CACRpkdb1CZKoaG6nNF-yBC3Eovoe3_0BHa6uO-OQkePDcrkamg@mail.gmail.com>
References: <1369378122-25897-1-git-send-email-linus.walleij@stericsson.com>
 <20130524082758.GP22683@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130524082758.GP22683-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2013 at 10:27 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 24 May 2013, Linus Walleij wrote:
>> From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Commits:
>> "ARM: ux500: Add Device Tree nodes for the ux500 Crypt device"
>> "ARM: ux500: Add Device Tree nodes for the ux500 Hash device"
>>
>> Added the crypto and hash devices conditionally, i.e. so as to
>> be turned on per-board by setting an "status" property on the
>> device from "disabled" to "okay" on each device.
>>
>> This is wrong since this is an SoC feature, it is not board
>> dependent. It is the same ASIC under all circumstances and
>> functionality does not vary with board family.
>>
>> This moves the enablement into the SoC file.
>>
>> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/dbx5x0.dtsi  | 4 ----
>>  arch/arm/boot/dts/snowball.dts | 8 --------
>>  2 files changed, 12 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/dbx5x0.dtsi b/arch/arm/boot/dts/dbx5x0.dtsi
>> index f051963..cd5cd09 100644
>> --- a/arch/arm/boot/dts/dbx5x0.dtsi
>> +++ b/arch/arm/boot/dts/dbx5x0.dtsi
>> @@ -760,17 +760,13 @@
>>                       compatible = "stericsson,ux500-cryp";
>>                       reg = <0xa03cb000 0x1000>;
>>                       interrupts = <0 15 0x4>;
>> -
>
> Why do you insist on removing all line spacings from the DTS file?
>
> I saw you removing them in between nodes too.

I was hit by a linespace when I was a child, since then I take
every opportunity for revenge.

If I keep the spacing, can I have your ACK?

Yours,
Linus Walleij
