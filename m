From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] Initial Device Tree system for Snowball
Date: Fri, 2 Mar 2012 18:05:54 +0100
Message-ID: <20120302170554.GA21255@game.jcrosoft.org>
References: <1330703567-17925-1-git-send-email-niklas.hernaeus@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1330703567-17925-1-git-send-email-niklas.hernaeus-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Niklas Hernaeus <niklas.hernaeus-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thomas Espersson <thomas.espersson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16:52 Fri 02 Mar     , Niklas Hernaeus wrote:
> From: Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This is the base system for using Device Tree for Snowball.
> The new boardfile is a slightly modified copy of the original board file,
> so new Device Tree stuff can simply be added and code removed, while
> functionality stays the same.
duplicating the code is not a good idea

do the invert put the minimum in c and then add the rest slowly via DT

Best Regards,
J.
