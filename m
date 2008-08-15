From: "Timur Tabi" <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2] DTC: Remove support for the legacy DTS source file
	format.
Date: Fri, 15 Aug 2008 10:17:31 -0500
Message-ID: <ed82fe3e0808150817k66d6c70fp17774fbd726ea2b2@mail.gmail.com>
References: <E1KTlq7-0005Gh-Co@jdl.com> <20080815002936.GA9877@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080815002936.GA9877-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 14, 2008 at 7:29 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Aug 14, 2008 at 06:02:43PM -0500, Jon Loeliger wrote:
>> Now that all in-kernel-tree DTS files are properly /dts-v1/,
>> remove direct support for the older, un-numbered DTS
>> source file format.
>
> Um.. why?  I just don't see a compelling reason to remove this
> backwards compatibility.  It costs us very little to keep it around
> indefinitely.

I agree, why are we removing backwards compatibility?  The dts-v1
format isn't that old, so I'm sure there are plenty of device trees
out there, especially on our BSPs, that haven't been updated yet.

How about just printing a warning and saying that the device tree
should be updated with the conversion tool?

-- 
Timur Tabi
Linux kernel developer at Freescale
