From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: No support of platform device instance id?
Date: Sat, 19 Mar 2011 20:45:47 -0600
Message-ID: <AANLkTim4xoztp7DdS3P2Be2tEHwspiFUKMux4KDf3i1J@mail.gmail.com>
References: <20110312070057.GB9650@S2100-06.ap.freescale.net>
	<20110312094620.GM9347@angua.secretlab.ca>
	<20110312145532.GA10194@S2100-06.ap.freescale.net>
	<20110314211019.GH16096@angua.secretlab.ca>
	<20110316135800.GB11658@S2100-06.ap.freescale.net>
	<20110316230500.GB15557@angua.secretlab.ca>
	<20110317043114.GG11658@S2100-06.ap.freescale.net>
	<20110317170819.GF9597@angua.secretlab.ca>
	<20110320023905.GA27709@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110320023905.GA27709-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 19, 2011 at 8:39 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Thu, Mar 17, 2011 at 11:08:19AM -0600, Grant Likely wrote:
>> On Thu, Mar 17, 2011 at 12:31:15PM +0800, Shawn Guo wrote:
>> > On Wed, Mar 16, 2011 at 05:05:00PM -0600, Grant Likely wrote:
>> > >
>> > [...]
>> > > I'd like to have feedback on the new code to make sure that the model
>> > > is sane. =A0There are some fiddly code it there which is used to mat=
ch
>> > > platform_device registrations to nodes in the device tree. =A0I *thi=
nk*
>> > > it makes sense, but I'd like to hear other opinions.
>> > >
>> > Binding platform_device with of_node via resources matching seems a
>> > little fiddly, but your implementation looks solid to me. =A0I made a
>> > quick scan on all the platform_device registration under
>> > arch/arm/plat-mxc/devices, nothing would be broken, only except
>> > platform-gpio_keys which is not an on-chip device.
>>
>> Right; and doing it this way doesn't make sense for anything that is
>> board/system specific because if the board is using the DT, then it is
>> simpler and more reliable to avoid the matching heuristic entirely.
>>
>> > Looking at the code, I'm wondering how the binding of resource type
>> > IORESOURCE_DMA looks like. =A0I'm seeing some platform_device is using
>> > this flag to tell dma channel fixed for the device. =A0I'm not sure if
>> > it can be fit in property 'dma-ranges'. =A0And I only see IORESOURCE_M=
EM
>> > and IORESOURCE_IRQ being used in the matching model.
>>
>> The matching is simply a heuristic that makes a best guess about how
>> how device nodes line up with platform_device registrations. =A0Right
>> now the heuristic is to look at the register ranges and irqs described
>> in the node and make sure that each of them are listed in the
>> platform_device. =A0If the platform_device has additional resources,
>> then it simply ignores them. =A0That seems to be sufficient for accurate
>> matching, but I won't know for sure until people start using it.
>>
>> If there are situations where the heuristic does not work, then I'd
>> like to know what they are so that the algorithm can be fixed, or in
>> the absolute worst case implement workaround logic.
>>
>> One option I'm considering which would improve the accuracy of the
>> heuristic is to add a 'char *of_compatible' field to struct
>> platform_device. =A0Then platform_devices could optionally be tagged
>> with the compatible value that must be present in order to be matched
>> with a node.
>>
>> I definitely want feedback on the matching heuristic!
>>
> Tested on babbage with serial, fec and esdhc drivers, and I did see
> it solves problems of clkdev dev_id matching and pdev->id use. =A0And
> it even helped to discover one problem with .end definition of fec
> resource IORESOURCE_MEM. =A0I will send mainline a patch for that soon.

Awesome, thanks!

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
