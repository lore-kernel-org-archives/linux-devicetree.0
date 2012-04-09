From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] of: add clock providers
Date: Mon, 09 Apr 2012 08:52:35 -0500
Message-ID: <4F82E9A3.1030606@gmail.com>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-3-git-send-email-robherring2@gmail.com>
 <20120409115549.GB18692@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120409115549.GB18692-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/09/2012 06:55 AM, Shawn Guo wrote:
> On Tue, Mar 13, 2012 at 06:22:22PM -0500, Rob Herring wrote:
> ...
>> +==Clock consumers==
>> +
>> +Required properties:
>> +clocks:		List of phandle and clock specifier pairs, one pair
>> +		for each clock input to the device.  Note: if the
>> +		clock provider specifies '0' for #clock-cells, then
>> +		only the phandle portion of the pair will appear.
> 
> Per discussion[1], the parent of the clock could be reasonably
> represented in C code instead of in device tree.  Then how can
> this "clocks" property be "Required"?  Or to put it another way,
> if this is "Required", the whole clock tree will have to be represented
> in device tree, no?
> 

I'm not sure I follow. All of this only applies if you are doing clock
setup from DT. Whether you represent all clocks or only the outputs to
devices in DT is up to you. So you could have a CCM node for imx with 50
clock outputs and all the intermediate clocks within the CCM are
represented with C code.

In other words, at minimum you are just replacing the clkdev lookup with
a DT lookup.

Rob

>> +
>> +Optional properties:
>> +clock-names:	List of clock input name strings sorted in the same
>> +		order as the clocks property.  Consumers drivers
>> +		will use clock-names to match clock input names
>> +		with clocks specifiers.
>> +clock-ranges:	Empty property indicating that child nodes can inherit named
>> +		clocks from this node. Useful for bus nodes to provide a
>> +		clock to their children.
>> +
>> +For example:
>> +
>> +    device {
>> +        clocks = <&osc 1>, <&ref 0>;
>> +        clock-names = "baud", "register";
>> +    };
> 
> Regards,
> Shawn
> 
> [1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/139414/focus=1216423
