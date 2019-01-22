From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v1] pinctrl: mediatek: improve Kconfig dependencies
Date: Tue, 22 Jan 2019 22:00:48 +0800
Message-ID: <1548165648.2429.13.camel@mtkswgap22>
References: <e4eb66dec2901016e01767932461c5d560762f66.1544666839.git.ryder.lee@mediatek.com>
 <CACRpkdZMgnj2S8xPPFm3PnDGrqTerOwWcS-+Uruy1uLH24HRLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZMgnj2S8xPPFm3PnDGrqTerOwWcS-+Uruy1uLH24HRLg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>, Weijie Gao =?UTF-8?Q?=28=E9=AB=98=E6=83=9F=E6=9D=B0=29?= <Weijie.Gao@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CC: stable@vger.kernel.org

On Fri, 2018-12-21 at 18:17 +0800, Linus Walleij wrote:
> On Thu, Dec 13, 2018 at 3:28 AM Ryder Lee <ryder.lee@mediatek.com> wrote:
> 
> > Remove prompts to make all pinctrl cores to non-visible symbols and
> > make sure the target SoCs would be coupled with the corresponding
> > cores.
> >
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> 
> Patch applied with ACK and Tested-by.
> 
> Yours,
> Linus Walleij

I forgot to add stable-kernel into CC list.
This patch should be applied to stable-rc linux-4.20.y.

Sorry for the inconvenience. 
Ryder
