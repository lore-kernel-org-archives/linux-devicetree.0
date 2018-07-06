From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 4/5] ASoC: dt-bindings: Update dt
 binding name for apq8096
Date: Fri, 6 Jul 2018 18:51:14 +0100
Message-ID: <cf28657d-3ca7-f0d6-8614-04d021ce909f@linaro.org>
References: <1530870195-13576-1-git-send-email-rohitkr@codeaurora.org>
 <1530870195-13576-5-git-send-email-rohitkr@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1530870195-13576-5-git-send-email-rohitkr@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Rohit kumar <rohitkr@codeaurora.org>, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, plai@codeaurora.org, bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/07/18 10:43, Rohit kumar wrote:
> Remove qcom prefix from machine driver dt bindings of
> apq8096 SoC.
Yes, this is a good move to make everything inline!

> 
> Signed-off-by: Rohit kumar<rohitkr@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/sound/qcom,apq8096.txt | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
