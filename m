From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v3] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Fri, 16 Mar 2012 09:32:18 +0530
Message-ID: <4F62BB4A.9090708@st.com>
References: <1331808632-22585-1-git-send-email-sr@denx.de>
 <4F61CC81.1020902@st.com> <201203151140.27453.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203151140.27453.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/15/2012 5:10 PM, Arnd Bergmann wrote:
> I don't have the data sheet, so the bus hierarchy above is completely made up,
> but I guess you get the idea. If each bus has its own local register range, it
> may be helpful to use the ranges property to remap the reg properties in the
> way that I did in the apb example above.

Got your point.

@Stefan: You can get this information from clock.c to see which clocks have ahb as parent
and which have apb as parent.

Over that i have kept them in groups/order in the lookup array too. So that would also be
very helpful.

-- 
viresh
