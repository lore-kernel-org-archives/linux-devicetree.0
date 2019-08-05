From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] arm64: dts: fast models: Increase clcd's
 max-memory-bandwidth
Date: Mon, 5 Aug 2019 12:18:06 +0200
Message-ID: <CACRpkdbPhxW2-vDhPDz-KpD-AxPJL+Px_ZH8cWVVbCiYpJh3PA@mail.gmail.com>
References: <20190725145040.42182-1-kevin.brodsky@arm.com>
 <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Sudeep Holla <sudeep.holla@arm.com>, Brian Starkey <brian.starkey@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 5:15 PM Robin Murphy <robin.murphy@arm.com> wrote:

> Given that the property is optional anyway, would it hurt to just remove
> it? After trying to dig up any relevant internal email history, it's
> still far from clear how and why it got here in the first place.

Isn't it just my sloppy copy-paste when fixing up the device trees
for the DRM transition? I agree it should just be removed.

Yours,
Linus Walleij
