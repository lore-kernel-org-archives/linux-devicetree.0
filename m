From: Jerry Huang <jerry.huang@nxp.com>
Subject: RE: [PATCH v3 2/3] USB3/DWC3: Add property "snps,
 incr-burst-type-adjustment" for INCR burst type
Date: Fri, 10 Feb 2017 15:16:36 +0000
Message-ID: <DB5PR0401MB181337ABF15D0C02DB4342E4FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com>
References: <1482139554-13618-1-git-send-email-jerry.huang@nxp.com>
 <1482139554-13618-2-git-send-email-jerry.huang@nxp.com>
 <20161222184514.hfd4g7ifrz5cv627@rob-hp-laptop>
 <DB5PR0401MB1813E210B2ADE1C9493F7768FE950@DB5PR0401MB1813.eurprd04.prod.outlook.com>
 <CAL_JsqJuifiSQAt-6FgtYYSukAnjzOLuTGEsO-Spn5LxkU-iwQ@mail.gmail.com>
 <DB5PR0401MB181361EBAD1B2BFA8DC5ED7AFE610@DB5PR0401MB1813.eurprd04.prod.outlook.com>
 <CAL_JsqJLr7pFSd5DW2ghNmn5-Lggrefp=GMPLOiiQmmqyPU4iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJLr7pFSd5DW2ghNmn5-Lggrefp=GMPLOiiQmmqyPU4iA@mail.gmail.com>
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
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "balbi@kernel.org" <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> >> >> Why do you need the first field? Is the 2nd field used if the 1st is 0?
> >> >> If not, then just use the presence of the property to enable or not.
> >> > The first field is one switch.
> >> > When it is 1, means undefined length INCR burst type enabled, we
> >> > can use
> >> any length less than or equal to the largest-enabled burst length of
> >> INCR4/8/16/32/64/128/256.
> >> > When it is zero, means INCRx burst mode enabled, we can use one
> >> > fixed
> >> burst length of 1/4/8/16/32/64/128/256 byte.
> >> > So, the 2nd field is used if the 1st is 0, we need to select one
> >> > largest burst
> >> length the USB controller can support.
> >> > If we don't want to change the value of this register (use the
> >> > default value),
> >> we don't need to add this property to usb node.
> >>
> >> Just make this a single value with 0 meaning INCR and 4/8/16/etc being
> INCRx.
> > Maybe, I didn't describe it clearly.
> > According to DWC3 spec, the value "0" of field INCRBrstEna means INCRx
> burst mode, 1 means INCR burst mode.
> > Regardless of the value of INCRBrstEna [bit0], we need to modify the other
> field bit[1,2,3,4,5,6,7] to one INCR burst type  for the platform supported.
> > Ad you mentioned, if we just use a single value with 0 meaning INCR and
> 4/8/16/etc being INCRx.
> > I understand totally that when it is none-zero, we can use it for INCR burst
> mode.
> > Then, when it is 0, how to select the INCRx value?
> 
> What I mean is:
> <no prop> - burst disabled
Yes, I understand it.
> 0 - INCR burst. INCR is undefined length burst IIRC.
When INCR is undefined length, we need to set the max INCR type, too, such as when setting INCR16, controller can use any length less than or equal to the 16 byte.
> 4/8/16/etc. - INCR4/INCR8/INCR16/etc.
I understand it, too.
> 
> What case does this not cover?
According to Balbi's suggestion, I changed the property like below, you can see the detail in v4 (sent by 1/18/2017)
Property "snps,incr-burst-type-adjustment = <x>, <y>..." for USB3.0 DWC3.
When Just one value means INCRx mode with fix burst type.
When more than one value, means undefined length burst mode, USB controller can use the length less than or equal to the largest enabled burst length.
