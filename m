From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: mvebu: add gate ctrl for Prestera kirkwood
 variants
Date: Tue, 07 May 2013 18:36:29 +0200
Message-ID: <51892D8D.4060704@gmail.com>
References: <1367941941-19152-1-git-send-email-valentin.longchamp@keymile.com>
 <1367941941-19152-2-git-send-email-valentin.longchamp@keymile.com>
 <518927C0.6070600@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <518927C0.6070600-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/07/2013 06:11 PM, Gregory CLEMENT wrote:
> On 05/07/2013 05:52 PM, Valentin Longchamp wrote:
>> The kirkwood device found in the Prestera SoCs does not have all the
>> peripherals of its the usual kirkwood SoCs. There are hence missing
>> clocks in the SoCs.
>>
>> This patch registers another gate controller for the kirkwood that
>> registers only the available clocks of this kirkwood variant.
>
> Hi Valentin,
>
> Overall the patch set looks OK, however I don't understand why you need
> to declare a new gate controller. The list you delcared seemed to be
> just a subset of the Kirkwood one, why can't you use this one?
>
> Note that I am not an expert for the kirkwood hardware, so maybe I
> missed something.

I just checked my mails from late 2012 and there Valentin and I agreed,
that not the missing bits in clock gating control registers was the root
cause of km_kirkwood to hang. It was rather the phy gates (that do not/
not yet exist on DT) that caused it to hang, i.e. when accessing SATA
PHY registers.

Valentin, I am not against an extra clock-gating-ctrl for Prestera but
maybe having an kirkwood.dtsi fork without SATA and other peripherals
will also help?

And: Does DT-enabled km_kirkwood ever hang without the hack in it's
board setup? There should be no PHY gates on DT boards..

Sebastian
