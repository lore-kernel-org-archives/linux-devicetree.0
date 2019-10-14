From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 06/10] ASoC: dt-bindings: cros_ec_codec:
 add SHM bindings
Date: Mon, 14 Oct 2019 12:23:22 -0500
Message-ID: <20191014172322.GA16336@bogus>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191014180059.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
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

On Mon, 14 Oct 2019 18:20:18 +0800, Tzung-Bi Shih wrote:
> - Add "reg" for binding to shared memory exposed by EC.
> - Add "memory-region" for binding to memory region shared by AP.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/google,cros-ec-codec.txt   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
