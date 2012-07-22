From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Forcing PIO mode instead of DMA via DT property
Date: Sun, 22 Jul 2012 23:28:26 +0200
Message-ID: <201207222328.27008.marex@denx.de>
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
Cc: pavel-ynQEQJNshbs@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi guys,

I'm trying to implement a driver that can do both DMA and PIO, and it would be 
nice if the user was able to select the mode (on a per-bus basis) using the DT. 
The PIO mode can reduce the overhead in some cases and therefore be better 
choice than the DMA (for example when most transfers move only very few data, or 
when board-specific hardware properties kick in).

I was thinking about using some "manf,use-pio" DT property, but I haven't found 
any such example yet, so I wonder if this is a good idea.

What is your suggestion how I shoud address such a problem?

Thanks in advance!

Best regards,
Marek Vasut
