From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: OF_DYNAMIC usage
Date: Fri, 06 Jul 2012 10:18:51 +0200
Message-ID: <4FF69F6B.4050101@monstr.eu>
References: <4FF586D1.2050407@monstr.eu> <4FF594AD.6000401@gmail.com>
 <1341521210.6330.16.camel@pasglop> <4FF67F96.1040902@monstr.eu>
 <1341555562.6330.51.camel@pasglop> <4FF68ADE.3060609@monstr.eu>
 <1341558520.6330.54.camel@pasglop> <4FF69B83.3000400@monstr.eu>
 <1341562219.6330.57.camel@pasglop>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341562219.6330.57.camel@pasglop>
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
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/2012 10:10 AM, Benjamin Herrenschmidt wrote:
> On Fri, 2012-07-06 at 10:02 +0200, Michal Simek wrote:
>
>> ok. How that FDT blob segment should look like?
>> It can't be just one node because it also requires path where it is connected.
>>
>> It means at least the part like below for injecting.
>
> No, my idea was to pass 3 arguments:
>
>   - action (enum)
>   - path (string)
>   - segment (blob)
>
> action would be typically add/remove
>
>   * add: add node under<path>  whose content is in<segment>
>
>   * remove: remove node<path>  and all children
>
> (or we could require children removal to be done explicitly).

ok.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
