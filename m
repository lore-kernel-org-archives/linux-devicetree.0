From: Chen Guangyu-B42378 <B42378@freescale.com>
Subject: Re: [PATCH V5] ASoC: fsl: add imx-wm8962 machine driver
Date: Mon, 10 Jun 2013 17:44:18 +0000
Message-ID: <E31481825E4C03459FC878EE97CB2EFD02FE6AC0@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1370607974-6895-1-git-send-email-b42378@freescale.com>,
 <20130610170838.GP1403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20130610170838.GP1403@sirena.org.uk>
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
To: Mark Brown <broonie@kernel.org>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org


On Tue, Jun 11, Mark Brown wrote:
> These are just recorded in the struct but never actually seem to be
> used?

hmm..I was thinking if I should put the jack detection code into this patch.
After the drop decision, I forgot to remove them from the struct. 
Okay...I will remove them in v6 to make patch be more clear.

Thank you.
