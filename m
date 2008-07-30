From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: i2c: improve last resort compatible entry selection
Date: Wed, 30 Jul 2008 08:42:02 -0600
Message-ID: <20080730144202.GB21958@secretlab.ca>
References: <20080714175437.GA5230@polina.dev.rtsoft.ru>
	<20080727001119.GB12191@secretlab.ca>
	<9e4733910807262205l2db8d662u9dd2e517282686f8@mail.gmail.com>
	<fa686aa40807262235l47bff0bfi15d86a6e171d6775@mail.gmail.com>
	<9e4733910807270721h5777bb80u9f3d25413a62883c@mail.gmail.com>
	<77a246d166f3eafb4d6a5d899ff86945@kernel.crashing.org>
	<9e4733910807271500l23fd2b12n940197474a5291df@mail.gmail.com>
	<043095cdcd52bb7af5cf4373b249b302@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <043095cdcd52bb7af5cf4373b249b302-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 28, 2008 at 09:47:21AM +0200, Segher Boessenkool wrote:
>>>  A reasonable "compatible" value would be something like
>>> "serial-eeprom-24c32".
>>>  You can go a little bit more generic than that, if you write up in
>>>  your binding how the driver should figure out the device size and
>>>  the protocol used.
>>
>> Matching on "serial-eeprom-24c32" requires me to convince the at24
>> authors to add that string as an alias binding for their driver.
>
> No, it requires the IIC subsystem to get fixed and not use OF
> "compatible" values as module alias names.

Indeed; the device tree is just a data structure with a well defined
usage model.  It is the kernel's job to adapt that data into a form that
it can use.

>> How
>> about "serial-eeprom,24c32" or "generic,24x32"?
>
> Neither "serial-eeprom" nor "generic" is the name of a vendor, so
> no.  The comma has a well-defined meaning.  Why would a comma be
> easier than a dash for your device matching code, anyway?

Just to add my voice; I 100% agree.  If it is not documented, and it
doesn't fit with established conventions, then it shouldn't be used in
the compatible field.

g.
