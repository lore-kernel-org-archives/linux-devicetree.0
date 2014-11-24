From: nick <xerofoify@gmail.com>
Subject: Re: FIX ME in xsysace.c
Date: Mon, 24 Nov 2014 06:28:08 -0500
Message-ID: <54731648.8010006@gmail.com>
References: <5472B1D6.7080805@gmail.com>
 <5a8be93a4204429daf16bc8f62cdd0cd@BY2FFO11FD005.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5a8be93a4204429daf16bc8f62cdd0cd@BY2FFO11FD005.protection.gbl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, soren.brinkmann@xilinx.com, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 14-11-24 02:47 AM, Michal Simek wrote:
> Hi,
> 
> On 11/24/2014 05:19 AM, nick wrote:
>> Greetings Michal and others,
>> I am wondering about the FIX ME in xsysace.c as it seems not correct due to my knowledge of most hardware protocols using a predetermined bit wide and therefore this could be hard coded. If someone can respond on if I am correct in removing this fix me it would be greatly appreciated.
> 
> I think that will be the best to c&p that fixme which you are talking about.
> Definitely feel free to fix whatever fixme is there and send the patch
> for fixing it.
> 
> Thanks,
> Michal
> 
Here is the fix me.
int bus_width = ACE_BUS_WIDTH_16; /* FIXME: should not be hard coded */
Cheers Nick
