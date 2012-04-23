From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: add error message to pinmux_map_to_setting's
 error path
Date: Mon, 23 Apr 2012 20:49:34 +0200
Message-ID: <4F95A43E.9000005@openwrt.org>
References: <1335202806-19520-1-git-send-email-blogic@openwrt.org>
 <4F95A162.3080200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F95A162.3080200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


> There are some other cases where more error messages would be useful,
> such as invalid function name, invalid config options etc. I was
> planning on going through the code and adding these since some of these
> are hitting me on a new board I'm adding to mainline. Are you planning
> to add more of these messages, or should I go ahead with that?

I am in the process of converting the mips/lantiq/ target to OF and
pinctrl amongst over things.
i stumbled across the 2 patches i mailed today. i will be able to spare
a couple of hours tomorrow
to see if i can find more places where debug output would make sense.


> I wonder if the message would be more useful if it said something like
> "invalid group %s for function %s" - that would give a little more
> information for the user to track down the incorrect entry, since that
> group name may be valid in general, just not for the function being
> converted.
that is the case. lets see what i can come up with.


> BTW, the "Cc" you added to the commit description doesn't appear to be
> happening; I'm only receiving this message through the list.
I realized this aswell, although i am subscribed to the list (even
checked if i subscribed with this mail addr) .
i will check the server logs and contact the list admins to see whats up
