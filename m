From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposed bindings for a GPIO watchdog drivers
Date: Tue, 16 Apr 2013 07:51:26 +0100
Message-ID: <20130416065126.5FEBB3E14C0@localhost>
References: <CALRpspn7UN4EVwQz8gt1S3Hg=bNR6MMuz=844XSpt=syQO6r-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CALRpspn7UN4EVwQz8gt1S3Hg=bNR6MMuz=844XSpt=syQO6r-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Alexander Morozov <etesial-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Mar 2013 20:04:30 +0400, Alexander Morozov <etesial-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
> 
> I've written a watchdog driver for simple chips that are connected via
> GPIO. Driver can be used with chips from different manufacturers.
> Should "compatible" property be set to "gpio-wdt" or
> "generic,gpio-wdt"? Are there any other problems with following
> bindings?

The trick with things like 'simple' gpio connections are that they may
not be very simple at all, and there are many different ways that the
interface can be designed to work. The most important thing here is that
you document exactly the protocol used by this hardware. So, not just
that is uses a GPIO pin, but /how/ the gpio pin is used. Is it a pulse?
Is it edge or level sensitive? etc.

g.

> 
> ---------
> 
> Required properties:
> - compatible: must be "generic,gpio-wdt".
> - gpios: gpio pin to use
> - ping-sec: how often to ping the watchdog before userspace watchdog
> daemon is started,
> - timeout-sec: watchdog timeout that is reported to userspace.
> 
> Example:
> 
> max6369 {
>         compatible = "generic,gpio-wdt";
>         gpios = <&pioB 13 0>;
>         ping-sec = <5>;
>         timeout-sec = <60>;
> };
> 
> Regards,
> Alexander Morozov.
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
