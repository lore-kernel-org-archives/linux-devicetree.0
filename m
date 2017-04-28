From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Fri, 28 Apr 2017 18:37:33 +0300
Message-ID: <CAHp75VfYPfm_GKPzvX7Go010fRi99t12ub7VUPubB6z3HnsFLg@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com> <SG2PR06MB11658E6434EB343246ADC9F58A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB11658E6434EB343246ADC9F58A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 6:16 PM, Chris Brandt <Chris.Brandt@renesas.com> wr=
ote:
> On Friday, April 28, 2017, Andy Shevchenko wrote:
>> Had you read the following, esp. Note there?
>>
>> * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does
>> not
>> *      affect the pin's ability to drive output.  1 enables input, 0
>> disables
>> *      input.
>>
>> For me manual is clearly tells about this settings:
>> "This register enables or disables the input buffer while the output
>> buffer is enabled."
>
>
> But, then if we use "input-enable" to get bi-directional functionality,

It seems you are missing the point from electrical prospective.
Standard pin buffers (electrically) means input buffer and output
buffer that are driven independently in most cases.

Here is one example:
https://electronics.stackexchange.com/questions/96932/internal-circuitry-of=
-io-ports-in-mcu/96953#96953

(That's what I asked before as a schematic)

> now we need something to replace what we were using "input-enable" for.

No.

> We were using "input-enable" to signal when the pin function that we set =
also needs to be forcible set to input by the software (once again, because=
 the HW is not smart enough to do it on its own), but is different than the=
 bi-directional functionality (ie, a different register setting).

You are trying to introduce an abstraction, called BiDi, which is
*not* a separate thing from a set of pin properties.

> So, if we replace "bi-directional" with "input-enable" (since logically i=
nternally that is what is going on), what do we use for the special pins th=
at the HW manual says "hey, you need to manually set these pins to input wi=
th SW because the pin selection HW can't do it correctly)".

Yes.
BiDi is an alias to output + input enable + other pin configuration
parameters (a set depends on real HW needs).

> Note that we added a enable-output for the same reason.
> See RZ/A1H HW Manual section "Table 54.7 Alternative Functions that PIPCn=
.PIPCnm Bit Should be Set to 0"

Perhaps needs to be revisited as well.

P.S. It looks like more and more software engineers are going far from
real hardware when developing drivers...

--=20
With Best Regards,
Andy Shevchenko
