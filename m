From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Mon, 27 Oct 2008 23:20:59 -0600
Message-ID: <fa686aa40810272220w13dfbbadm7cda4ed2036ebc2b@mail.gmail.com>
References: <4900ED81.3040202@genesi-usa.com> <49011C42.2020101@firmworks.com>
	<20081024032944.GE4267@yookeroo.seuss>
	<49014C69.8020408@firmworks.com>
	<20081024044511.GI4267@yookeroo.seuss>
	<490248C2.9020104@genesi-usa.com>
	<20081026234747.GD22339@yookeroo.seuss> <4905E0DC.104@genesi-usa.com>
	<20081028001511.GD26424@yookeroo.seuss>
	<4906620B.7080308@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4906620B.7080308-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 27, 2008 at 6:51 PM, Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org> wrote:
>
>
> David Gibson wrote:
>>
>> On Mon, Oct 27, 2008 at 10:40:12AM -0500, Matt Sealey wrote:
>>
>> So, you use
>>        gpios = <&controller pin1-specifier &controller pin8-specifier
>>                 &controller pin9-specifier &controller pin11-specifier
>>                 &controller pin15-specifier &controller pin30-specifier>;
>
> Okay that makes some more sense to me.
>
> So now my qualm is back to the beginning of the discussion. How do
> we encode the purpose of those pins reliably and within some
> standard framework, without getting *driver* specific?
>
> Take the example of an LCD controller with an 8-bit bus and two
> control pins, if you put all 10 into a gpios property, explicit
> knowledge of the purpose of those pins is lost. It must then be
> encoded directly into the driver..

I disagree.  With the approach we've been following the meaning of
those 10 gpio pins is not lost because we make a point of documenting
it (granted in the Linux kernel tree at the moment which is far from
ideal).  The knowledge of what those GPIOs are for is all bound up
with the documented binding attached to the compatible value.

> I liked Anton's suggestion of grouping them and creating new nodes,
> but you didn't like it when it was suggested before, so, I'm
> wondering if there's a middle ground..

I've got no problem with this myself, but I don't think it really adds
much in terms of additional information because users still need to
refer to binding documentation to figure out what it actually means.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
