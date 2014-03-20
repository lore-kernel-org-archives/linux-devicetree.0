From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ASoC: tda998x: Fix lack of required reg in DT
 documentation
Date: Thu, 20 Mar 2014 13:26:33 +0000
Message-ID: <20140320132633.GT7528@n2100.arm.linux.org.uk>
References: <20140320092639.48F68A6279@smtp3-g21.free.fr>
 <532ADFD8.80301@gmail.com> <20140320140156.5d768b1f@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20140320140156.5d768b1f@armhf>
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

On Thu, Mar 20, 2014 at 02:01:56PM +0100, Jean-Francois Moine wrote:
> On Thu, 20 Mar 2014 13:32:24 +0100
> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:
> 
> > > +  - reg: I2C address - must be <0x70>  
> > 
> > TDA9983b datasheet says:
> > 
> > "Bits A0 and A1 of the I2C-bus device address are externally selected
> > by pins A0 and A1."
> > 
> > Therefore, 0x70, 0x71, 0x72, and 0x73 are valid i2c addresses.
> 
> Sebastian,
> 
> That's interesting!
> 
> For the Cubox and the AMX33XX boards, the I2C address of the HDMI
> registers is 0x70, and the I2C address of the CEC registers is 0x34.
> 
> For other boards using the TDA998x family, if the I2C address is
> different from 0x70, have you an idea about what can be the CEC I2C
> address? (this value is actually hard-coded in the TDA998x driver)

For the TDA9983, it's configurable as Sebastian says.  For the TDA19988,
they're fixed at 0x70 and 0x34.

To put it another way: it is chip specific, and is specified by the
data sheet, not by the software, and should not be specified as an
"required value" with any particular value in the DT binding
specification.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
