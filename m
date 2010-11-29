From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Mon, 29 Nov 2010 20:44:45 +0100
Message-ID: <4CF402AD.2060000@linutronix.de>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>		<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>		<1290808645.32570.158.camel@pasglop>	<20101128160449.GC30784@www.tglx.de>	<1290984809.32570.208.camel@pasglop>
	<4CF30327.9020408@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CF30327.9020408-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mitch Bradley wrote:
> On 11/28/2010 12:53 PM, Benjamin Herrenschmidt wrote:
>>> I wasn't aware of the OFW binding for X86. I will follow it once I find
>>> it.
>> Interesting, I though I would find it on
>> http://www.openfirmware.info/Bindings but it's not there...
>> CC'ing Mitch who might know where to find that.
> 
> I'd be happy to work with people to develop a new x86 binding.

So for the CPU node I have so far:

         cpus {
                  #address-cells = <1>;
                  #size-cells = <0>;

                  cpu@0 {
                          device_type = "cpu";
			 compatible = "Intel,CE4100";
                          reg = <0>;
                          lapic = <&lapic0>;
                  };
          };

This one should match ePARP 1.0. David mentioned threads. I have just one.
No HyperThreading, nothing special. Should I just leave it as it or go
for:
         cpus {
                  #address-cells = <1>;
                  #size-cells = <0>;

                  cpu@0 {
                          device_type = "cpu";
			 compatible = "Intel,CE4100";	
			 reg = <0>;
                	         lapic = <&lapic0>;

			thread@0 {
         	                 reg = <0>;
                  	};
		};
          };
?

Sebastian
