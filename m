From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Thu, 11 Apr 2013 10:10:09 -0600
Message-ID: <5166E061.1050008@wwwdotorg.org>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <CAMuHMdWFVi=AFR8prins0mees4BFUUXirCC2swyQPwGs7Tt8uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWFVi=AFR8prins0mees4BFUUXirCC2swyQPwGs7Tt8uQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Rob Clark <robclark@gmail.com>, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/11/2013 04:42 AM, Geert Uytterhoeven wrote:
> On Thu, Apr 4, 2013 at 4:39 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> +       { "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0} },
> 
> Why "r5g6b5" instead of "rgb565", which is what's commonly used?

Both representations appear commonly used.

I mentioned my rationale in response to V1: "r5g6b5" is a much more
well-defined structure. It's directly algorithmically parse-able if
required, whereas you'd need somewhat more complex heuristics to
determine exactly what rgb565 or argb2101010 mean, since all the numbers
are run together without delimiters.
