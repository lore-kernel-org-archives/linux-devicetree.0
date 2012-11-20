From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/3] power: Add simple poweroff-gpio driver
Date: Tue, 20 Nov 2012 10:11:18 -0700
Message-ID: <50ABB9B6.1010506@wwwdotorg.org>
References: <1353142266-1289-1-git-send-email-andrew@lunn.ch>
 <1353142266-1289-2-git-send-email-andrew@lunn.ch>
 <50AA6E7E.5060501@wwwdotorg.org> <20121120083749.GM10259@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121120083749.GM10259-g2DYL2Zd6BY@public.gmane.org>
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
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/20/2012 01:37 AM, Andrew Lunn wrote:
> Hi Jason
> 
> These are good comments from Stephan that i want to address. However,
> i also don't want to delay the pull-requests direction arm-soc, the
> merge window is getting close. Both Linus and Anton have Acked the
> current version, so please go with what you have and i will produce a
> patch over the top. If its available before Arnd pulls, you can squash
> it, otherwise send it upstream as a standalone patch.

I'm not sure I agree here; the comments I made re: the delays and
pulse-vs-level may affect the definition of the DT binding, and that's
something that should be correct from the start.

The implementation of gpio_poweroff_do_poweroff() really doesn't seem to
make sense; related to the above.

Also, probe deferral doesn't work, which will likely make this code
completely ineffective.
