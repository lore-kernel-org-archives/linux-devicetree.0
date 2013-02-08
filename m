From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] input: Extend matrix-keypad device tree binding
Date: Fri, 08 Feb 2013 12:59:24 +0000
Message-ID: <20130208125924.65E803E2B73@localhost>
References: <1357868492-16023-1-git-send-email-sjg@chromium.org> <50F0473F.404@wwwdotorg.org>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <50F0473F.404@wwwdotorg.org>
Sender: linux-input-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Simon Glass <sjg@chromium.org>
Cc: Roland Stigge <stigge@antcom.de>, Vincent Palatin <vpalatin@chromium.org>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@ti.com>, Wolfram Sang <w.sang@pengutronix.de>, Luigi Semenzato <semenzato@chromium.org>, Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, linux-input@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Sourav Poddar <sourav.poddar@ti.com>, Alban Bedel <alban.bedel@avionic-design.de>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Jan 2013 10:09:19 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 01/10/2013 06:41 PM, Simon Glass wrote:
> > Some matrix keypad drivers can support different numbers of rows and
> > columns. Add a generic binding for these.
> > 
> > Implementation note:
> > 
> > In order to implement this binding in the kernel, we will need to modify
> > matrix_keypad_() to look up the number of rows and cols in
> > the keymap. Perhaps this could be done by passing 0 for these parameters?
> > Many of the parameters can already be set to NULL. Ick.
> 
> Reviewed-by: Stephen Warren <swarren@nvidia.com>

Applied, thanks.

g.

