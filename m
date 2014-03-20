From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ASoC: tda998x: Fix lack of required reg in DT
 documentation
Date: Thu, 20 Mar 2014 14:31:10 +0000
Message-ID: <20140320143110.GU7528@n2100.arm.linux.org.uk>
References: <20140320092639.48F68A6279@smtp3-g21.free.fr>
 <532ADFD8.80301@gmail.com> <20140320140156.5d768b1f@armhf>
 <532AEDE2.3080306@gmail.com> <20140320145221.09252bf6@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20140320145221.09252bf6@armhf>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 20, 2014 at 02:52:21PM +0100, Jean-Francois Moine wrote:
> Thanks for the link.
> 
> OK, then, as the linux tda998x driver handles only the tda 19988 and
> 19989 chips, the HDMI I2C address is always 0x70.
> 
> So, question: Russell and Sebastian, do you still want an other patch?
> 
> Other question: the CEC address is hard-coded to 0x34 in the driver.
> Should it be configurable in the DT?

As we haven't had a mainline non-rc kernel release with this in yet,
we have more scope in what we can do to sort this out.  What I'd
suggest is:

1. change the DT compatible strings the driver has to accept both
   nxp,tda19988 and nxp,tda19989, and set the appropriate device
   in the DT file (tda19988).  I'm a bit nervous about using
   "nxp,tda1998x" in case we're clashing with devices with different
   characteristics.

2. specify that the i2c reg address must exist, but not specify what
   it should be - leave that open.

3. assume that there's a CEC at 0x34 for these two devices.

If we wish to extend support to tda998x, then we'd need to modify the
driver quite a bit anyway.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
