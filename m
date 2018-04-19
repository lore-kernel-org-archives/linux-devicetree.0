MIME-Version: 1.0
In-Reply-To: <CAL_JsqKei-nWz-6RPqXZNErrnTnh5p8bvq_J_qe7Q+jKTRuuPQ@mail.gmail.com>
References: <CACxGe6twt3qTzp6sWNJXxRQTx_p=n8wNQ0mVCTdoauT0oXUWYA@mail.gmail.com>
	<CAL_JsqKei-nWz-6RPqXZNErrnTnh5p8bvq_J_qe7Q+jKTRuuPQ@mail.gmail.com>
Date: Thu, 19 Apr 2018 17:57:11 -0500
Message-ID: <CAL_Jsq+YY9h9WZU_YFwS87mHj6KdBsDK_MppF1K2m7e7i0vc+w@mail.gmail.com>
Subject: Re: Devicetree Schema Checking Prototype
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 6, 2018 at 10:04 AM, Rob Herring <robh@kernel.org> wrote:
> Hi all,
>
> I've been busy working on the DT schema again the last few weeks. I've
> now got DT schema checking working and integrated into the DT binding
> repository[1] using the tools in the yaml-bindings repo. This gives us
> end to end functionality on the full tree of dts files validated
> against binding schema docs (albeit limited checks currently).
>
> As part of this I've worked on some tooling to help automate
> converting the existing binding documents to yaml. This works pretty
> well even with free form text input because most files follow the same
> structure. It's not perfect, but helps fill in some of the
> boilerplate. The script is called doc2yaml and can fill in the doc
> title, description and example for bindings that follow this form:
>
> SOF
> Title text
>
> Some lines of description
>
> *properties:
>
> example[s]:
>
> some-node {
>
> };
> EOF
>
> On top of this, I wrote a second tool called dt-prop-populate that can
> fill in some of the property schema using the dts files as input. The
> top 2 commits in the DT repository are the output of these 2 scripts.
> I've committed the output because they are fairly slow to run.
>
>
> To run all this, in addition to the yaml-bindings repo Grant listed
> below, you need the DT binding repo[1] and dtc with yaml output[2].
> Then run either of the 2 make targets:
>
> # Check binding files
> make checkbindings
>
> # Check dts files against schema
> make DTC=path/to/dtc checkdt
>
>
> For next steps, I want to document and finalize the binding schema
> format for review. The top level part is pretty straightforward. For
> example, see [3]. It's all standard json schema keywords with the
> addition of "maintainers" and possibly "historical". It's really the
> property schemas that need some work. They are dependent on the DT
> yaml encoding. Currently, integers are always encoded as a matrix even
> for a single cell. For example, #size-cells looks like this:
>
> '#size-cells': [[1]]
>
> This is makes for verbose json schema just to say '#size-cells must be 1":
>
> '#size-cells':
>   type: array
>   items:
>     - type: array
>       items:
>         - const: 1
>       minItems: 1
>       additionalItems: false
>   minItems: 1
>   additionalItems: false
>
> Perhaps we can generate everything except the "const: 1" part. The
> downside is complexity of the validation script and execution time.
> Just loading all the schema files as-is is already slow. This also
> highlights how the binding schema format is tightly coupled to the DT
> yaml encoding.

I've implemented support for doing this now. Additionally, another
related area that was bothering me was that arrays of items are not
fixed size by default in jsonschema. If one specifies schema for an
array of N items, the schema will pass as long as the first N items
pass or if there are fewer than N items and those pass. This behavior
can be fixed by specifying:

minItems: N
maxItems: N
additionalItems: false

But this too can become a lot of boilerplate in binding schema. I
can't think of cases where we don't want to specify these. So I've
implemented code to count 'items' lists and add these properties as
needed. If any of these properties are present, then we bail on the
fixup.

It's all of about 20 lines to implement both of these.

Rob

>
> Rob
>
>
> [1] https://github.com/robherring/devicetree-rebasing.git yaml-bindings
> [2] https://github.com/robherring/dtc.git yaml-bindings
> [3] https://github.com/robherring/yaml-bindings/blob/master/test/schemas/good-example.yaml
>
>
> On Sun, Mar 18, 2018 at 11:15 PM, Grant Likely
> <grant.likely@secretlab.ca> wrote:
>> Hi folks,
>>
>> I'll be talking about this at Linaro Connect in Hong Kong later today
>> (I believe the session with be recorded and put on YouTube; I'll send
>> the link when it is). Rob and I have been working on a prototype
>> implementation of schema checking written in Python, using YAML schema
>> files and using the JSON Schema vocabulary. Here's the link to the
>> project on GitHub:
>>
>> https://github.com/robherring/yaml-bindings
>>
>> Look at the README file for instructions on setting up the environment
>> (might be buggy; works on my machine, but Rob had problems with it ...
>> Will try to make it more robust tomorrow)
>>
>> Please remember that this is prototype code and I am not suggesting it
>> is ready to use. What it does do in very few lines of Python code
>> (about 250 lines, plus 75 lines of test code) is implement a basic
>> tool which validates both devicetrees, and devicetree schema files. At
>> this stage it is a conceptual design, but it doesn't yet work with the
>> devicetree files in the kernel. It does work with a YAML-transcoded
>> copy of the Juno devicetree in the tests/ directory. You can run the
>> validator against the Juno file with the following command:
>>
>> $ ./dt-validate.py tests/juno.cpp.yaml
>>
>> You can run the test cases just by running:
>>
>> $ make test
>>
>> Finally, you can see an example of a schema file failing validation
>> tests with this command:
>>
>> $ make demo-bad-schema
>>
>> If you run that from within Vim, it will map the errors back to lines
>> of source code.
>>
>> Cheers,
>> g.
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
