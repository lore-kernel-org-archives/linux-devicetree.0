From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [RFC 12/13] ARM: dts: ti: add dra71-evm FIT description file
Date: Tue, 29 May 2018 23:51:14 +0100
Message-ID: <20180529225114.GO17671@n2100.armlinux.org.uk>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-13-git-send-email-t-kristo@ti.com>
 <20180417092924.GB20335@flint.armlinux.org.uk>
 <ad5ef67d-d566-0034-a7cd-09a549cbd6d7@ti.com>
 <20180417144913.GD5669@atomide.com>
 <43ff3894-a287-1558-687c-40f50712735c@ti.com>
 <20180522200100.GA23937@rob-hp-laptop>
 <16a6017f-96c8-42d8-38bc-5cdd36d6793f@gmail.com>
 <20180529173314.GN17671@n2100.armlinux.org.uk>
 <a43ce521-ed7f-6126-4ebf-5e0e303d00a3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <a43ce521-ed7f-6126-4ebf-5e0e303d00a3@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>, trini@konsulko.com, wmills@ti.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 29, 2018 at 03:45:12PM -0700, Frank Rowand wrote:
> If the kernel applies the overlay, an alternative to drivers is that the
> kernel could receive the overlay(s) in a similar manner as the method it
> currently receives the base devicetree.  (The overlay(s) could be
> appended to the base devicetree, a wrapper could be placed around the

No wrappers, sorry.  We already have too many places in the Linux
kernel and its decompressor that try to work out whether a device
tree or ATAGs are present and how large, and that is done in assembly
code.  We don't need more complexity to deal with some kind of
wrapping of device trees as well.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
