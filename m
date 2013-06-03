From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH RFC 0/3] clk: dt: bindings for mux & divider clocks
Date: Tue, 4 Jun 2013 00:31:02 +0200
Message-ID: <201306040031.02935.heiko@sntech.de>
References: <1370281990-15090-1-git-send-email-mturquette@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370281990-15090-1-git-send-email-mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 3. Juni 2013, 19:53:07 schrieb Mike Turquette:
> This series introduces binding definitions for common register-mapped
> clock multiplexor and divider IP blocks, and the corresponding setup
> functions once they are matched.  The bindings are close the struct
> definitions but please don't hold that against the binding: the struct
> definitions closely model the hardware.
> 
> The only missing basic clock type is the gate clock.  A binding for that
> was posted some time back and is similar in spirit to these[1].  I guess
> we'll need to decide whether register-level programming details belong
> in DT.  I believe they do since those details describe the hardware.
> 
> Note that there is still no generic clock driver that matches these
> basic types, but it would be trivial to write one.  Thoughts on that?
> Is it better for each of the basic clock types to be a driver that
> matches, or should there be one drivers/clk/clk-basic.c which matches
> all of the basic clock building blocks?  I like the latter for aesthetic
> purposes.
> 
> I am using this code while converting the OMAP4 clock data over to DT
> and some common boilerplate code can be factored out of several clock
> drivers if this is merged.

apart from the stuff pointed out in the replies to the patches this works 
really well on my upcoming Rockchip platform and saves quite a lot silly clock 
definitions whose only purpose is to hold the shift and width values.


So, for this series:

Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
