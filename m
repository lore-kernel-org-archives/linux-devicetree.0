From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 05/10] ASoC: cros_ec_codec: read max
 DMIC gain from EC codec
Date: Fri, 11 Oct 2019 10:14:06 -0500
Message-ID: <20191011151406.GA18450@bogus>
References: <20191005085509.187179-1-tzungbi@google.com>
 <20191005164320.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191005164320.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org, tzungbi@google.com, broonie@kernel.org, enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com
List-Id: devicetree@vger.kernel.org

On Sat,  5 Oct 2019 16:55:04 +0800, Tzung-Bi Shih wrote:
> Read max DMIC gain from EC codec instead of DTS.  Also removes the
> dt-binding of max-dmic-gain.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/google,cros-ec-codec.txt   |  4 +-
>  .../linux/platform_data/cros_ec_commands.h    | 43 +++++++++++----
>  sound/soc/codecs/cros_ec_codec.c              | 53 ++++++++++++++-----
>  3 files changed, 73 insertions(+), 27 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
