From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/4 v2] mtd/powerpc: Remove unused "device-width" property
Date: Sun, 12 Apr 2009 00:01:12 -0600
Message-ID: <fa686aa40904112301q6bcdd23enc23c745b6198a447@mail.gmail.com>
References: <1239093575-12147-1-git-send-email-sr@denx.de>
	<49DB8271.8050501@freescale.com> <200904071854.16818.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <200904071854.16818.sr-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 7, 2009 at 10:54 AM, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org> wrote:
> On Tuesday 07 April 2009, Scott Wood wrote:
>> Stefan Roese wrote:
>> > This property is unused. It's not handled as all by the physmap_of
>> > driver. So let's remove it from the documentation.
>> >
>> > Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
>> > CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>
>> The device tree describes the hardware, not what Linux happens to do
>> with it at the moment.
>>
>> I'd rather keep it.
>
> I find it rather confusing to "see" such bindings that are not supported. One
> could expect something to happen/change after defining this property. So in
> general I think adding unsupported properties to the Documentation is a bad
> idea. But that's just my 2 cents. If the general opinion is to keep this
> property, I'll keep it in of course.

I say keep it.  It is a valid way to describe the hardware regardless
of whether or not the driver supports it yet.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
