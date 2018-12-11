From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: bus: imx-weim: document multiple
 address ranges per child node
Date: Tue, 11 Dec 2018 14:03:49 +0800
Message-ID: <20181211060348.GW3987@dragon>
References: <20181206192633.25319-1-TheSven73@googlemail.com>
 <20181206192633.25319-3-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206192633.25319-3-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: TheSven73@googlemail.com, Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 06, 2018 at 02:26:32PM -0500, Sven Van Asbroeck wrote:
> The imx-weim driver was patched to allow correct WEIM configuration
> when multiple address ranges are used in a child node.
> Update the dt-bindings to reflect this.
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@googlemail.com>

The bindings patch should go first in the series.

Shawn
