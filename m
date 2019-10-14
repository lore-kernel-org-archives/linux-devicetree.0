From: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v3 00/10] ASoC: mediatek:
 mt8183-mt6358-ts3a227-max98357: support WoV
Date: Mon, 14 Oct 2019 20:34:06 +0800
Message-ID: <CA+Px+wXt0Y95t3qzdxWaP94w+Jnr30sRUHfa97FymPvG25Y6qA@mail.gmail.com>
References: <20191014102022.236013-1-tzungbi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191014102022.236013-1-tzungbi@google.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Mark Brown <broonie@kernel.org>
Cc: Gwendal Grignou <gwendal@google.com>, devicetree@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>, Jimmy Cheng-Yi Chiang <cychiang@google.com>, Nicolas Boichat <drinkcat@google.com>, robh+dt@kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 14, 2019 at 6:20 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> This series makes mt6358, cros_ec_codec, and mt8183-mt6358-ts3a227-max98357
> support WoV (wake on voice).
>
> The first 3 commits are some cleanups and refactors.  It looks like
> breaking the existing interface.  But please be noticed that, the
> cros_ec_codec has not used by any real device yet.  The refactor is
> very necessary to keep the style consistent and for easier to further
> extend and maintain.
>   platform/chrome: cros_ec: remove unused EC feature
>   ASoC: cros_ec_codec: refactor I2S RX
>   ASoC: cros_ec_codec: extract DMIC EC command from I2S RX
>
> The 4th commit extends the feature offered from EC codec.
>   platform/chrome: cros_ec: add common commands for EC codec
>
> The 5th commit changes the behavior of setting and getting DMIC gains.
>   ASoC: cros_ec_codec: read max DMIC gain from EC codec
>
> The 6th and 7th commit make cros_ec_codec support WoV.
>   ASoC: dt-bindings: cros_ec_codec: add SHM bindings
>   ASoC: cros_ec_codec: support WoV
>
> The 8th commit sets necessary registers on mt6358 to support WoV.
>   ASoC: mediatek: mt6358: support WoV
>
> The last 2 commit make machine driver mt8183-mt6358-ts3a227-max98357
> support WoV if ec-codec is in DTS.
>   ASoC: dt-bindings: mt8183: add ec-codec
>   ASoC: mediatek: mt8183: support WoV
>
> Changes from v1:
> - fix a compile error and make kbuild bot happy
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156315.html
> Changes from v2:
> - rebase upon to "don't use snd_pcm_ops" series
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156170.html
> - fix sparse errors
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156328.html
> - use "reg" for SHM binding
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156657.html
>
> Tzung-Bi Shih (10):
>   WIP: platform/chrome: cros_ec: remove unused EC feature
>   WIP: ASoC: cros_ec_codec: refactor I2S RX
>   WIP: ASoC: cros_ec_codec: extract DMIC EC command from I2S RX
>   WIP: platform/chrome: cros_ec: add common commands for EC codec
>   WIP: ASoC: cros_ec_codec: read max DMIC gain from EC codec
>   WIP: ASoC: dt-bindings: cros_ec_codec: add SHM bindings
>   WIP: ASoC: cros_ec_codec: support WoV
>   WIP: ASoC: mediatek: mt6358: support WoV
>   WIP: ASoC: dt-bindings: mt8183: add ec-codec
>   WIP: ASoC: mediatek: mt8183: support WoV

Ha..I noticed here are some "WIP" prefixes forgot to remove.  To not
generate too much flood, will fix in later versions.

>
>  .../bindings/sound/google,cros-ec-codec.txt   |   24 +-
>  .../sound/mt8183-mt6358-ts3a227-max98357.txt  |    3 +
>  drivers/platform/chrome/cros_ec_trace.c       |    5 +-
>  .../linux/platform_data/cros_ec_commands.h    |  285 ++++-
>  sound/soc/codecs/cros_ec_codec.c              | 1128 +++++++++++++----
>  sound/soc/codecs/mt6358.c                     |  105 ++
>  sound/soc/mediatek/Kconfig                    |    1 +
>  .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   70 +-
>  8 files changed, 1296 insertions(+), 325 deletions(-)
>
> --
> 2.23.0.700.g56cf767bdb-goog
>
