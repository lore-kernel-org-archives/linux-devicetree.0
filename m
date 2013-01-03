From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
Date: Thu, 03 Jan 2013 15:26:37 +0400
Message-ID: <50E56AED.1000509@mvista.com>
References: <1343632944-25971-1-git-send-email-hs@denx.de>
 <50E48DFD.2030908@mvista.com> <50E52D26.9010004@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50E52D26.9010004-ynQEQJNshbs@public.gmane.org>
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
To: hs-ynQEQJNshbs@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 03-01-2013 11:03, Heiko Schocher wrote:

>>> add OF support for the davinci nand controller.

>>> Signed-off-by: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
>>> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
>>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>>> Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: David Woodhouse<dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>>> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>> Cc: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
>>> Cc: Wolfgang Denk<wd-ynQEQJNshbs@public.gmane.org>
>>> Cc: Scott Wood<scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

>> [...]

>>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci=
_nand.c
>>> index d94b03c..f386b3c 100644
>>> --- a/drivers/mtd/nand/davinci_nand.c
>>> +++ b/drivers/mtd/nand/davinci_nand.c
>> [...]
>>> @@ -518,9 +519,75 @@ static struct nand_ecclayout hwecc4_2048 __initcon=
st =3D {
>>>       },
>>>   };

>>> +#if defined(CONFIG_OF)
>>> +static const struct of_device_id davinci_nand_of_match[] =3D {
>>> +    {.compatible =3D "ti,davinci-nand", },
>>> +    {},
>>> +}

>>     I have only one question: have you ever try to compile this patch wi=
th
>> CONFIG_OF enabled? If you have, you would have noticed:

>> drivers/mtd/nand/davinci_nand.c:527: error: expected =91,=92 or =91;=92 =
before =91extern=92

>>> +MODULE_DEVICE_TABLE(of, davinci_nand_of_match);

> Hmm.. maybe this crept in later after I sent the patches? They were
> pending for a while ... I compiled it just yet again (based on my
> tree when I posted this patch based on commit:

    I've just checked the archives: every patch version you posted had ';' =

after '}' missing.

WBR, Sergei
