From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 1/2] ARM: dts: imx6sx-sdb: update TX D_CAL for USBPHY
Date: Mon, 7 Nov 2016 01:32:29 +0000
Message-ID: <VI1PR04MB14556348390F18AF8D5A261D8BA70@VI1PR04MB1455.eurprd04.prod.outlook.com>
References: <1477882709-2518-1-git-send-email-peter.chen@nxp.com>
 <20161105083145.GF5597@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161105083145.GF5597@dragon>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

 
>On Mon, Oct 31, 2016 at 10:58:28AM +0800, Peter Chen wrote:
>> We need to change trimming value (as a percentage) of the 17.78mA TX
>> reference current for better signal quality. With this change, we can
>> patch the eye-diagram test on this board.
>
>s/patch/pass?  I just want to confirm this is a typo, and can fix it up when applying.
>

Thanks, Shawn. It is a typo. Help me to change both of patches please.

Peter
