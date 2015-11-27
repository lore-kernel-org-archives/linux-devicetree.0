From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RESEND RFC/PATCH 3/8] media: platform: mtk-vpu: Support Mediatek
 VPU
Date: Fri, 27 Nov 2015 12:21:25 +0000
Message-ID: <56584AC5.7020704@linaro.org>
References: <1447764885-23100-1-git-send-email-tiffany.lin@mediatek.com>
 <1447764885-23100-4-git-send-email-tiffany.lin@mediatek.com>
 <5655DDB4.2080002@linaro.org> <1448626209.7734.26.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448626209.7734.26.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: andrew-ct chen <andrew-ct.chen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Daniel Kurtz <djkurtz@chromium.org>, Darren Etheridge <detheridge@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Eddie Huang <eddie.huang@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Fabien Dessenne <fabien.dessenne@st.com>, Peter Griffin <peter.griffin@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Benoit Parrot <bparrot@ti.com>, Rob
List-Id: devicetree@vger.kernel.org

On 27/11/15 12:10, andrew-ct chen wrote:
>>> +
>>> > >+	memcpy((void *)send_obj->share_buf, buf, len);
>>> > >+	send_obj->len = len;
>>> > >+	send_obj->id = id;
>>> > >+	vpu_cfg_writel(vpu, 0x1, HOST_TO_VPU);
>>> > >+
>>> > >+	/* Wait until VPU receives the command */
>>> > >+	timeout = jiffies + msecs_to_jiffies(IPI_TIMEOUT_MS);
>>> > >+	do {
>>> > >+		if (time_after(jiffies, timeout)) {
>>> > >+			dev_err(vpu->dev, "vpu_ipi_send: IPI timeout!\n");
>>> > >+			return -EIO;
>>> > >+		}
>>> > >+	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>> >
>> >Do we need to busy wait every time we communicate with the co-processor?
>> >Couldn't we put this wait*before*  we write to HOST_TO_VPU above.
>> >
>> >That way we only spin when there is a need to.
>> >
> Since the hardware VPU only allows that one client sends the command to
> it each time.
> We need the wait to make sure VPU accepted the command and cleared the
> interrupt and then the next command would be served.

I understand that the VPU  can only have on message outstanding at once.

I just wonder why we busy wait *after* sending the first command rather 
than *before* sending the second one.

Streamed decode/encode typically ends up being rate controlled by 
capture or display meaning that in these cases we don't need to busy 
wait at all (because by the time we send the next frame the VPU has 
already accepted the previous message).


Daniel.
