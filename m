From: Alexander Morozov <etesial-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Proposed bindings for a GPIO watchdog drivers
Date: Tue, 26 Mar 2013 20:04:30 +0400
Message-ID: <CALRpspn7UN4EVwQz8gt1S3Hg=bNR6MMuz=844XSpt=syQO6r-A@mail.gmail.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

I've written a watchdog driver for simple chips that are connected via
GPIO. Driver can be used with chips from different manufacturers.
Should "compatible" property be set to "gpio-wdt" or
"generic,gpio-wdt"? Are there any other problems with following
bindings?

---------

Required properties:
- compatible: must be "generic,gpio-wdt".
- gpios: gpio pin to use
- ping-sec: how often to ping the watchdog before userspace watchdog
daemon is started,
- timeout-sec: watchdog timeout that is reported to userspace.

Example:

max6369 {
        compatible = "generic,gpio-wdt";
        gpios = <&pioB 13 0>;
        ping-sec = <5>;
        timeout-sec = <60>;
};

Regards,
Alexander Morozov.
