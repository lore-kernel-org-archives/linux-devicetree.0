From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: <Query> Reg: Adding a gpio initialization sequence in dts is
 valid or not
Date: Fri, 17 Aug 2012 09:13:57 -0600
Message-ID: <502E5FB5.3060307@wwwdotorg.org>
References: <CAL1wa8fjJg33vVM4ZOFuA2ACps55cahoK65MDf4ebAi9B6KUxg@mail.gmail.com>
 <502269EC.2070008@gmail.com> <502287E1.3040508@wwwdotorg.org>
 <50231B55.6070007@nvidia.com>
 <CAL1wa8d-6qXOXS2+sVZAgnpGw0-x03WKpOhiVhSKZ3JoQZW1fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAL1wa8d-6qXOXS2+sVZAgnpGw0-x03WKpOhiVhSKZ3JoQZW1fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Leela Krishna Amudala <leelakrishna.a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/17/2012 04:37 AM, Leela Krishna Amudala wrote:
> Hello,
> 
> I think you misinterpreted my question.
> 
...
> But I don't bother about enabling regulator and pwm for my panel.
> 
> My panel needs a sequence like
> 1. Pull up a gpio line
> 2. Maintain some delay
> 3. Pull down gpio line
> 4. Maintain some delay and
> 5. Pull up a gpio line.

Yes, I think that kind of thing is exactly what the power sequences
bindings/driver are for.

But ...

> Please find the Image shown in the attachment for better understanding.
> 
> So, to get this done I used your code and created a node like below
> and it worked for me.
> 
> backlight {
>         compatible = "pwm-backlight";
>         brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176
> 192 208 224 240 255>;
>         default-brightness-level = <12>;
> 
>         enable-gpio1 = <&gpx1 5 1 0 0>;
>         enable-gpio2 = <&gpx3 0 0 0 0>;

In your original email, you mentioned that some of those cells for the
GPIO control the state features such as pull-up/-down and
drive-strength. Those two features should really be configured by
pinctrl not by the GPIO bindings, although that's a comment on the GPIO
bindings itself, and nothing to do with power sequences.
