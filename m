From: "Chaiken, Alison" <Alison_Chaiken@mentor.com>
Subject: RE: [PATCH] ARM: i.MX6: dts: change iomuxc pinctrl config to match
 Rev. 0 IMX6DQRM
Date: Mon, 26 Aug 2013 19:34:10 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B502E6B62D@NA-MBX-02.mgc.mentorg.com>
References: <1377495568-9368-1-git-send-email-alison_chaiken@mentor.com>,
 <CAHCPf3uSf20CJV4x4K3N0DU-nOmguJPrsEZynhXoeEb0eMnP3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHCPf3uSf20CJV4x4K3N0DU-nOmguJPrsEZynhXoeEb0eMnP3Q@mail.gmail.com>
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
To: Matt Sealey <neko@bakuhatsu.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alison@she-devel.com" <alison@she-devel.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "b32955@freescale.com" <b32955@freescale.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Matt Sealey [neko@bakuhatsu.net] helpfully inquires:
        Have these been cross-referenced against the same table in Rev 1 of the manual (4/2013)?

I respond: indeed they have been!    The configs in the patch have been checked against the table in the Rev. 1 April manual, which has a different format but not new values.    I absent-mindedly selected an old version of the commit message, sorry.

In addition, the configs have been tested with kernels older than the older release on multiple reference boards from Freescale and Boundary Devices.   Furthermore, many of the changes were ack'ed by Huang Shijie of FSL in, for example,

      http://www.mail-archive.com/devicetree-discuss@lists.ozlabs.org/msg32771.html

In April I submitted a related documentation patch

      http://www.mail-archive.com/devicetree-discuss@lists.ozlabs.org/msg30583.html

that has fallen by the wayside.   Sorry for failing to include this information in the original posting, but I could not get "git send-email --compose" to behave properly with emacsclient and employer's SMTP.

--
Alison Chaiken
Mentor Embedded Software Division
Fremont, CA USA
alison_chaiken@mentor.com
