From: "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>
Subject: Re: [PATCH RESEND] dmaengine: stm32-dma: Rework starting transfer
 management
Date: Tue, 3 Jan 2017 17:51:05 +0100
Message-ID: <CAOAejn2=xksxXmfzVRJV-5hAkbNyPX88vWUyPkGdh+ynoTkCdQ@mail.gmail.com>
References: <1483349607-16870-1-git-send-email-cedric.madianga@gmail.com>
 <20170103035703.GE3573@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170103035703.GE3573@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Vinod,

> ah sorry, i missed to push topic/stm32-dma. can you rebase onnthis and
> resend again. Btw this fails as as well..
I have tried again and I don't have any issue.
Please see below my way of working and let me know if there is
something I don't understand:

slave-dma git://git.infradead.org/users/vkoul/slave-dma.git
$ git fetch slave-dma
$ git checkout -b dma-fixes slave-dma/topic/dma-fixes
$ git checkout -b dma-stm32 slave-dma/topic/stm32-dma
$ git rebase dma-fixes
First, rewinding head to replay your work on top of it...
Applying: dmaengine: stm32-dma: Fix typo in Kconfig
Applying: dt-bindings: stm32-dma: Fix typo regarding DMA client binding
Applying: dmaengine: stm32-dma: Rework starting transfer management
Applying: dmaengine: stm32-dma: Fix residue computation issue in cyclic mode
Applying: dmaengine: stm32-dma: Add synchronization support
Applying: dmaengine: stm32-dma: Add max_burst support

Best regards,

Cedric
