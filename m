From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 07/12] memory: davinci-aemif: introduce AEMIF driver
Date: Tue, 26 Nov 2013 13:30:14 -0500
Message-ID: <5294E8B6.5000102@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-8-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8D2E@DNCE04.ent.ti.com>
 <52944BD3.90105@ti.com> <5294DE17.9080900@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <5294DE17.9080900@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sekhar Nori <nsekhar@ti.com>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob Landley <rob@landley.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Ivan,

On Tuesday 26 November 2013 12:44 PM, ivan.khoronzhuk wrote:
> On 11/26/2013 09:20 AM, Sekhar Nori wrote:
>> On Monday 11 November 2013 10:36 PM, Khoronzhuk, Ivan wrote:

>>> +static struct platform_driver davinci_aemif_driver = {
>>> +       .probe = davinci_aemif_probe,
>>> +       .remove = davinci_aemif_remove,
>>> +       .driver = {
>>> +               .name = DRV_NAME,
>>> +               .owner = THIS_MODULE,
>>> +               .of_match_table = of_match_ptr(davinci_aemif_of_match),
>>> +       },
>>> +};
>>> +
>>> +module_platform_driver(davinci_aemif_driver);
>>> +
>>> +MODULE_AUTHOR("Murali Karicheri <m-karicheri2@ti.com>");
>>
>> Is this correct? If yes, I would have expected him to sign-off on the
>> patch too. If not, please drop this.
> 
> I will add sign-off
> 
Please add you as a MODULE_AUTHOR as well since you re-wrote the
downstream driver. Ok to have both of you sign of on it.

Regards,
Santosh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
