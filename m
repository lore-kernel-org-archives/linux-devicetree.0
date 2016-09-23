From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH 0/3] regulator: axp20x: Simplify various code
Date: Fri, 23 Sep 2016 09:44:59 +0200
Message-ID: <cover.1474616699.git.moinejf@free.fr>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB254SO7QKGQESTHSNQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series just simplifies a bit the code of the AXP20x driver.
It does not contain any fonctional changes.
It will be used as a base for adding new AXP devices (patches to come).
It applies on linux-next.

Jean-Francois Moine (3):
  regulator: axp20x: simplify poly-phase handling
  regulator: axp20x: simplify the treatment of linked regulators
  regulator: axp20x: simplify device access

 drivers/regulator/axp20x-regulator.c | 114 ++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 54 deletions(-)

-- 
2.10.0
