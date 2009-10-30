From: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Subject: Re: [PATCH] mscan: add non-polling rx
Date: Fri, 30 Oct 2009 18:36:15 +0100
Message-ID: <4AEB240F.1080408@grandegger.com>
References: <1256902073-22328-1-git-send-email-l.fu@pengutronix.de>
	<4AEB2328.6090009@grandegger.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <socketcan-users-bounces-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org>
In-Reply-To: <4AEB2328.6090009-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
List-Unsubscribe: <https://lists.berlios.de/mailman/listinfo/socketcan-users>,
	<mailto:socketcan-users-request-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.berlios.de/pipermail/socketcan-users>
List-Post: <mailto:socketcan-users-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org>
List-Help: <mailto:socketcan-users-request-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org?subject=help>
List-Subscribe: <https://lists.berlios.de/mailman/listinfo/socketcan-users>,
	<mailto:socketcan-users-request-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org?subject=subscribe>
Sender: socketcan-users-bounces-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org
Errors-To: socketcan-users-bounces-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org
To: Luotao Fu <l.fu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, socketcan-users-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Wolfgang Grandegger wrote:
> Luotao Fu wrote:
>> This one adds an option to turn of napi and process rx directly in mscan isr. As
>> for mpc52xx this feature can be turned on by setting a rx-irq property int the
>> device tree, e.g:
>> can@980 {
>>     compatible = "fsl,mpc5200b-mscan","fsl,mpc5200-mscan";
>>     interrupts = <2 18 0>;
>>     rx-irq;
>>     reg = <0x980 0x80>;
>> };
>> Default is the polling rx.
>>
>> Signed-off-by: Luotao Fu <l.fu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> This has little chance to be accepted as the device tree is about
> hardware. It should not be used to tell the driver what to do (software
> settings). I have CCed the devicetree-discuss ML for clarification.

Forgot the CC to devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

Wolfgang.
