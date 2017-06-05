From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 07/17] regulator: arizona-micsupp: Add
 support for Cirrus Logic Madera codecs
Date: Mon, 5 Jun 2017 12:10:06 -0500
Message-ID: <20170605171006.3ppsjia2xvb22ld2@rob-hp-laptop>
References: <1496415790-19164-1-git-send-email-rf@opensource.wolfsonmicro.com>
 <1496415790-19164-8-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1496415790-19164-8-git-send-email-rf@opensource.wolfsonmicro.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: gnurou@gmail.com, alsa-devel@alsa-project.org, jason@lakedaemon.net, devicetree@vger.kernel.org, linus.walleij@linaro.org, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, tglx@linutronix.de, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 02, 2017 at 04:03:00PM +0100, Richard Fitzgerald wrote:
> This adds a new driver identity "madera-micsupp" and probe function
> so that this driver can be used to control the micsupp regulator on
> Cirrus Logic Madera codecs.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> ---
> No changes since V2
> 
>  .../bindings/regulator/arizona-regulator.txt       |  3 +-

I already acked v2. Please add acks when posting new versions.

>  drivers/regulator/Kconfig                          |  7 ++-
>  drivers/regulator/arizona-micsupp.c                | 71 +++++++++++++++++++++-
>  3 files changed, 76 insertions(+), 5 deletions(-)
