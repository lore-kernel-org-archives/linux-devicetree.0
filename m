From: "Hiremath, Vaibhav" <hvaibhav-l0cyMroinI0@public.gmane.org>
Subject: RE: am33xx: default to status = "disabled"?
Date: Fri, 3 Aug 2012 09:31:50 +0000
Message-ID: <79CD15C6BA57404B839C016229A409A83EA7F557@DBDE01.ent.ti.com>
References: <501B061A.6080008@gmail.com> <201208022328.17095.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201208022328.17095.arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 03, 2012 at 04:58:16, Arnd Bergmann wrote:
> On Thursday 02 August 2012, Daniel Mack wrote:
> > currently, all devices in arch/arm/boot/dts/am33xx.dtsi are enabled by
> > default. However, depending on the actual board dts, only some of the
> > devices should actually be initialized, given that they only make sense
> > if their pins are actually wired on the board.
> > 
> > On other platform, such devices are marked with status = "disabled", and
> > the board files re-enable those they really use by overriding that
> > status again. That approach seems to make sense - shouldn't the same be
> > done in am33xx.dtsi or am I missing something?
> 
> I agree, they should be disabled, at least the serial ports, and probably
> also the i2c controllers.
> 

You are right, it needs to be disabled. I will create a patch and submit it.

Thanks,
Vaibhav
