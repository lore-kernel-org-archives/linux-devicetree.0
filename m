From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 09/10] ASoC: dt-bindings: mt8183: add
	ec-codec
Date: Mon, 14 Oct 2019 12:23:36 -0500
Message-ID: <20191014172336.GA16992@bogus>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191014180059.09.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
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

On Mon, 14 Oct 2019 18:20:21 +0800, Tzung-Bi Shih wrote:
> Add an optional property "ec-codec".  If specified, mt8183 could use the
> "wake on voice" feature offered by EC codec.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
