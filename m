From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: Gpio reset handling
Date: Thu, 17 Sep 2009 08:46:13 +0200
Message-ID: <4AB1DB35.2010503@monstr.eu>
References: <4AAFDDD1.9070702@monstr.eu>
	<fa686aa40909151527r36334528ne1194523f141a8a2@mail.gmail.com>
	<20090916002459.GA8891@yookeroo.seuss>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090916002459.GA8891-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
> On Tue, Sep 15, 2009 at 04:27:04PM -0600, Grant Likely wrote:
>> On Tue, Sep 15, 2009 at 12:32 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> [snip]
>> So, something like this perhaps:
>>
>>     machine {
>>         compatible = "<vendor>,<board>-machine";
>>         soft-reset-gpio = <&gpio_res 1 1>;
>>         phy-reset-gpio = <&gpio_res 2 1>;
>>     };
>>
>> I don't much like the node name "machine", but I can't think of
>> anything better at the moment.
> 
> Why not put the reset properties in the root node?  They do pertain to
> the whole system, after all.
> 

I looked at powerpc dts in kernel and I haven't found it. Can you send me
example of it?

Thanks,
Michal






-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
