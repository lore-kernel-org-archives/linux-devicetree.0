From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v5 1/9] phy: add phy_get_bus_width()/phy_set_bus_width()
 calls
Date: Fri, 13 Dec 2013 15:25:50 +0530
Message-ID: <52AAD9A6.40907@ti.com>
References: <1386854770-2173-1-git-send-email-mporter@linaro.org>
 <1386854770-2173-2-git-send-email-mporter@linaro.org>
 <20131212181818.GI1939@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131212181818.GI1939@saruman.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com, Matt Porter <mporter@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <t.figa@samsung.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linaro Patches <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 12 December 2013 11:48 PM, Felipe Balbi wrote:
> Hi,
> 
> On Thu, Dec 12, 2013 at 08:26:02AM -0500, Matt Porter wrote:
>> This adds a pair of APIs that allows the generic PHY subsystem to
>> provide information on the PHY bus width. The PHY provider driver may
>> use phy_set_bus_width() to set the bus width that the PHY supports.
>> The controller driver may then use phy_get_bus_width() to fetch the
>> PHY bus width in order to properly configure the controller.
>>
>> Signed-off-by: Matt Porter <mporter@linaro.org>
> 
> Kishon, I need your Acked-by here, if you're ok with the change.

here it goes..
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> 
