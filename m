From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: How about a gpio_get(device *, char *) function?
Date: Wed, 31 Oct 2012 18:04:09 +0900
Message-ID: <38620644.IyR5R8rjKP@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Would anyone be opposed to having a gpio_get() function that works similarly 
to e.g. regulator_get() and clk_get()?

I can see some good reasons to have this:

- Less platform data to pass to drivers,
- Consistency between different subsystems. Regulator, clock, PWM, ... all use 
this scheme.
- The "device-specific indirection" could make some DT structures more 
reusable. Right now the only way to address a GPIO through the DT is via a 
phandle that includes the GPIO number - thus hard-coded.

The implementation would be rather simple, and the function would just return 
the right GPIO number (acquired through gpio_request).

Rationale for this: I would like to be able to share power sequences between 
devices, e.g. to completely extract the per-device resources from the 
sequence. Every power sequence step references either a regulator, PWM, or 
GPIO. For regulators and PWMs separation is easy because their subsystems 
provide regulator_get() and pwm_get() which allow the resource to be 
referenced by name in the sequence, and resolved to different instances 
depending on the device. GPIOs, on the other hand, can only be referenced by 
number - and that makes it necessary to duplicate the sequence's structure in 
memory for every device that may use it. It if was possible to reference GPIOs 
by names that resolve to different GPIO numbers according to the device, then 
the problem would be solved.

There are probably other use-cases that would benefit from this, if you know of 
one please feel free to share.

Thanks,
Alex.
